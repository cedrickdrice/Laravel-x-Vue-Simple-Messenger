<template>
    <div class="content">
        <messenger-chat-header
            :oMessages="oMessages"
            :oLoggedUser="oLoggedUser"
            :oSelectedUser="oSelectedUser"
            :getFacebookUrl="getFacebookUrl"
            :getTwitterUrl="getTwitterUrl"
            :getInstagramUrl="getInstagramUrl"
        ></messenger-chat-header>

        <messenger-chat-main :oMessages="oMessages" :oLoggedUser="oLoggedUser"></messenger-chat-main>

        <messenger-chat-form v-if="checkIfNotSelectedUser !== true"
                             :oSelectedUser="oSelectedUser"
                             v-model="file_upload"
                             @sendChatMessage="sendChatMessage"
        ></messenger-chat-form>

    </div>
</template>

<script>
    import { mapState, mapGetters, mapActions } from 'vuex';
    import MessengerChatHeader from "./MessengerChatHeader";
    import MessengerChatMain from "./MessengerChatMain";
    import MessengerChatForm from "./MessengerChatForm";

    export default {
        name: "MessengerChat",
        data() {
            return {
                chat_message: '',
                file_upload: ''
            }
        },
        emits: ['scrollToLatestMessage'],
        components: {
            MessengerChatHeader,
            MessengerChatMain,
            MessengerChatForm
        },
        props: {
            oUserAccounts: Object
        },
        computed: {
            ...mapState({
                oMessages       : state => state.chats.messages,
                oLoggedUser: state => state.chats.loggedUser,
                oSelectedUser   : state => state.chats.selectedUser,
            }),
            ...mapGetters([
                'checkIfNotSelectedUser',
            ]),
            getFacebookUrl() {
                return '//www.facebook.com/' + this.oUserAccounts.facebook;
            },
            getInstagramUrl() {
                return '//www.instagram.com/' + this.oUserAccounts.instagram;
            },
            getTwitterUrl() {
                return '//twitter.com/' + this.oUserAccounts.twitter;
            },
        },
        methods: {
            ...mapActions([
                'postSendChatMessage',
            ]),
            /**
             * Create Request and send message
             * @param oParameters
             */
            sendChatMessage: function (oParameters) {
                let oForm = new FormData();
                oForm.append('file', this.file_upload);
                oForm.append('message_to', oParameters.oSelectedUser.id);
                oForm.append('message', oParameters.oChat);
                this.postSendChatMessage(oForm)
                    .then(() => this.$emit('scrollToLatestMessage'))
                .catch(error => console.log(error));
            }
        }
    }
</script>

<style scoped>

</style>
