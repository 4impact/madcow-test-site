package au.com.ts4impact.madcow.test.site.domain

import grails.converters.*

class AddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "search", params: params)
    }


    def search = {
    }

    def searchTableLayout = {
    }

    def ajaxGetSuburbs = {
        def postCodes = PostCodeReference.findAllByPostCode("${params.id}")
        println "ajaxGetSuburbs for id : ${params.id} -> postCodes : $postCodes"
        render postCodes as JSON
    }

    def ajaxCheckForDuplicates = {
        println "Checking for duplicate  addresses. ${params}"

        //Sleep a random amount of time under 5 seconds to make this ajax laggy
        sleep new Random().nextInt(5001)

        def searchResults = Address.createCriteria().list(max: params.max, offset: params.offset) {

            ilike("addressLine1", "%${params.addressLine1}%")
            and {
                ilike("addressLine2", "%${params.addressLine2}%")
            }
            and {
                postCode {
                    eq("postCode", "${params.postCodeEntry}")
                }
            }
        }
        render searchResults.totalCount
    }

    def showSearchResults = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        params.offset = params?.offset?.toInteger() ?: 0

        def searchResults = Address.createCriteria().list(max: params.max, offset: params.offset) {
            or {
                ilike("addressLine1", "%${params.addressLines}%")
                ilike("addressLine2", "%${params.addressLines}%")
            }
            if (params.postCode) {
                and {
                    postCode {
                        eq("postCode", "${params.postCode}")
                    }
                }
            }
            if (params.suburb) {
                and {
                    postCode {
                        ilike("locality", "%${params.suburb}%")
                    }
                }
            }
            if (params.state) {
                and {
                    postCode {
                        eq("state.id", new Long(params.state))
                    }
                }
            }
        }

        params.totalAddresses = searchResults.totalCount

        [ addressInstanceList: searchResults, params : params]
    }

    def createTableLayout = {
        create()
    }

    def create = {
        create()
    }

    def create(){
        def addressInstance = new Address()
        addressInstance.properties = params
        return [addressInstance: addressInstance]
    }

    def save = {
        println "AddressController.save params : $params"

        def addressInstance = new Address(params)
        if (addressInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])}"
            redirect(action: "show", id: addressInstance.id)
        }
        else {
            if (params.createTableLayout)
                render(view: "createTableLayout", model: [addressInstance: addressInstance])
            else
                render(view: "create", model: [addressInstance: addressInstance])
        }
    }

    def show = {
        def addressInstance = Address.get(params.id)
        if (!addressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
        else {
            [addressInstance: addressInstance]
        }
    }

    def edit = {
        def addressInstance = Address.get(params.id)
        if (!addressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [addressInstance: addressInstance]
        }
    }

    def update = {

        // log initial details to save
        println "AddressController.update params : $params"

        def addressInstance = Address.get(params.id)
        if (addressInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (addressInstance.version > version) {

                    addressInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'address.label', default: 'Address')] as Object[], "Another user has updated this Address while you were editing")
                    render(view: "edit", model: [addressInstance: addressInstance])
                    return
                }
            }

            addressInstance.properties = params
            println "AddressController.update addressInstance after applying params : ${addressInstance}"

            if (!addressInstance.hasErrors() && addressInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])}"
                redirect(action: "show", id: addressInstance.id)
            }
            else {
                render(view: "edit", model: [addressInstance: addressInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def addressInstance = Address.get(params.id)
        if (addressInstance) {
            try {
                addressInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
    }
}
