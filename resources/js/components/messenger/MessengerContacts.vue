<template>
    <div id="contacts">
        <ul v-if="checkIfLoadedOnlineUser !== true">
            <li v-for="(chat, index) in oChats" :key="chat.id" class="contact" :class="setChatAsActive(chat)"
                @click="$parent.$emit('getSelectChat', chat)"
            >
                <div class="wrap">
                    <span class="contact-status" :class="setUserAsOnline(chat)" ></span>
                    <img :src="getChatWith(chat).image" alt="" />
                    <div class="meta">
                        <p class="name">{{ getChatWith(chat).name }}</p>
                        <p class="preview">{{ chat.message }}</p>
                        <small class="time">{{ chat.message_sent_time }}</small>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import { mapState, mapGetters } from 'vuex';
    export default {
        name: "MessengerContacts",
        emits: ['getSelectChat'],
        computed: {
            ...mapState({
                oChats          : state => state.chats.users,
                oSelectedUser   : state => state.chats.selectedUser,
                oLoggedUser     : state => state.chats.loggedUser,
                oOnlineUsers    : state => state.community.onlineUser
            }),
            ...mapGetters([
                'checkIfNotSelectedUser',
                'checkIfLoadedOnlineUser',
            ]),
        },
        methods: {
            /**
             * Get the name of who are you chatting with
             * @param participant
             * @returns {*}
             */
            getChatWith: function(participant) {
                if (participant.sender_id !== this.oLoggedUser.id) {
                    return participant.sender
                }
                if (participant.receiver_id !== this.oLoggedUser.id) {
                    return participant.receiver
                }
            },
            /**
             * [For Foreach] Check if user is online
             */
            setUserAsOnline: function(chat) {
                let oCurrentChat = this.getChatWith(chat);
                let oOnlineUser = this.oOnlineUsers.filter(oCurrentUser => {
                    return oCurrentUser.id === oCurrentChat.id
                });
                if (oOnlineUser.length > 0) {
                    return 'online';
                }
                return 'offline';
            },
            /**
             * [For Foreach] If Chat is selected chat message
             * @param chat
             * @returns {string}
             */
            setChatAsActive: function (chat) {
                if (this.checkIfNotSelectedUser === true) {
                    return;
                }
                let oCurrentChat = this.getChatWith(chat);
                if (this.oSelectedUser.id === oCurrentChat.id) {
                    return 'active';
                }
            }
        }
    }
</script>

<style scoped>

</style>
