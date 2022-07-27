<template>
    <div id="sidepanel">
        <div id="profile">
            <div class="wrap">
                <img id="profile-img" :src="oLoggedUser.image" class="online" alt="" />
                <p>{{ oLoggedUser.name }}</p>
                <fa icon="fa-chevron-down " aria-hidden="true" class="expand-button" @click="expandProfileButton"></fa>
                <div id="status-options">
                    <ul>
                        <li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li>
                        <li id="status-away"><span class="status-circle"></span> <p>Away</p></li>
                        <li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li>
                        <li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li>
                    </ul>
                </div>
                <div id="expanded">
                    <label for="twitter"><fa :icon="['fab', 'facebook-f']" class="fa-fw" aria-hidden="true"></fa></label>
                    <input name="twitter" type="text" v-model="oUserAccounts.facebook" />
                    <label for="twitter"><fa :icon="['fab', 'twitter']" class="fa-fw" aria-hidden="true"></fa></label>
                    <input name="twitter" type="text" v-model="oUserAccounts.twitter" />
                    <label for="twitter"><fa :icon="['fab', 'instagram']" class="fa-fw" aria-hidden="true"></fa></label>
                    <input name="twitter" type="text" v-model="oUserAccounts.instagram" />
                </div>
            </div>
        </div>

        <div id="search">
            <label for=""><fa icon="fa-search" aria-hidden="true"></fa></label>
            <input type="text" placeholder="Search contacts..."
                   @keyup.stop="doSearchUser"
                   @keyup.delete="doSearchUser"
                   @click="doShowSearchUser"
            />
            <div class="dropdown-clip" v-if="bShowUserSearch === true">
                <transition name="dropdown">
                    <div class="table-responsive boxscroll" style="overflow: hidden; outline: none;" tabindex="5000">
                        <table class="table mb-0">
                            <tbody>
                                <template v-if="oSearchUserList.length > 0">
                                    <tr v-for="(oUser, index) in oSearchUserList">
                                        <td class="border-top-0"
                                            :key="index"
                                            @click="doSelectUserChat(oUser)"
                                            @focus="doShowSearchUser"
                                        >
                                            <div class="media">
                                                <img :src="oUser.image" alt="" class="thumb-md rounded-circle">
                                                <div class="media-body ml-2">
                                                    <p class="mb-0">{{ oUser.name }}
                                                    </p>
                                                    <span class="font-12 text-muted">{{ oUser.email }}</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </template>
                                <template v-else>
                                    <tr>
                                        <td class="border-top-0">
                                            <div class="media">
                                                <div class="media-body ml-2">
                                                    <p class="mb-0">No User Found
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    </div>
                </transition>
            </div>
        </div>

        <messenger-contacts :oChats="oChats" :oLoggedUser="oLoggedUser" :oSelectedUser="oSelectedUser"></messenger-contacts>

        <div id="bottom-bar">
            <button id="addcontact"><fa icon="fa-user-plus" class="fa-fw" aria-hidden="true"></fa> <span>Add contact</span></button>
            <button id="settings"><fa icon="fa-cog" class="fa-fw" aria-hidden="true"></fa> <span>Settings</span></button>
        </div>
    </div>
</template>

<script>
    import MessengerContacts from "../contacts/MessengerContacts";
    export default {
        name: "MessengerSidebar",
        data() {
            return {
                bShowUserSearch: false,
                oSearchUserList: []
            }
        },
        emits: ['getSelectChat'],
        props: ['oLoggedUser', 'oUserAccounts', 'oChats', 'oSelectedUser'],
        components: {
            MessengerContacts
        },
        methods: {
            expandProfileButton: function () {
                document.getElementById("profile").classList.toggle("expanded");
                document.getElementById("contacts").classList.toggle("expanded");
            },
            doSelectUserChat: function(oUser) {
                this.$emit('getSelectChat', oUser);
                this.bShowUserSearch = false;
            },
            doShowSearchUser: function() {
                this.bShowUserSearch = !this.bShowUserSearch;
            },
            doSearchUser: function (oEvent) {
                let sKeyword = oEvent.target.value;
                if (sKeyword.length <= 3) {
                    this.oSearchUserList = [];
                    this.bShowUserSearch = true;
                    return false;
                }

                const oForm = {
                    search: sKeyword
                };
                axios.get('/api/user/search', {
                    params: oForm
                })
                .then(oResponse => {
                    this.oSearchUserList = oResponse.data.list;
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
    }
</script>

<style>
    .dropdown-clip {
        position: absolute;
        width: 100%;
        background-color: #2c3e50;
        z-index: 9999;
    }
    .table-responsive {
        overflow: hidden;
        outline: none;
        display: block;
        width: 100%;
    }
    .table-responsive table {
        width: 100%;
        border-bottom-color: #2c3e50;
    }
    .dropdown-clip {
        overflow: hidden;
    }
    .table td, .table th {
        cursor: pointer;
        padding: 10px!important;
        vertical-align: top;
    }
    .media {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: start;
        align-items: flex-start;
        width: 96%;
        margin: 0 auto;
    }
    .thumb-md {
        height: 48px;
        width: 48px;
    }
    .media-body {
        padding-top: 5px;
        margin-left: 10px!important;
        flex: 1;
    }
    .media-body p {
        font-weight: 600;
        margin-bottom: 0!important;
        font-size: 13px;
        color: #f5f5f5;
    }
    .media-body span {
        font-size: 12px;
    }
    .dropdown-enter-active,
    .dropdown-leave-active {
        transition: all 0.5s ease-in-out;
        transform: initial;
    }
    .dropdown-enter-from,
    .dropdown-leave-to {
        opacity: 0;
        transform: translateY(-300px);
    }
</style>
