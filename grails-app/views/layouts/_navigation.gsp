<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="#">
                <img src="${resource(dir:'images',file:'Address-Book_48x48.png')}" height="22" width="22"/> Address Book
            </a>

            <ul class="nav">
                <li class="active">
                    <a href="#">Home</a>
                </li>
                <li>
                    <g:link controller="Address" action="create">Create Address</g:link>
                </li>
                <li>
                    <g:link controller="Address" action="search">Search</g:link>
                </li>
                <li>
                    <a href="http://www.projectmadcow.com">Project Madcow</a>
                </li>
                <li class="divider-vertical"></li>
            </ul>

            <ul class="nav pull-right">
                <li class="dropdown">
                    <a href="#"
                       class="dropdown-toggle"
                       data-toggle="dropdown">
                        Admin
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <g:link controller="PostCodeReference" action="create">Create Post Code</g:link>
                        </li>
                        <li>
                            <g:link controller="PostCodeReference" action="list">View Post Codes</g:link>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <g:link controller="State" action="create">Create State</g:link>
                        </li>
                        <li>
                            <g:link controller="State" action="list">View States</g:link>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>