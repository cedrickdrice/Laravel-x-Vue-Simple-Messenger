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

        <messenger-chat-form v-if="oSelectedUser.length !== 0"
                             :oSelectedUser="oSelectedUser"
                             v-model="file_upload"
                             @sendChatMessage="sendChatMessage"
        ></messenger-chat-form>

    </div>
</template>

<script>
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
        emits: ['updateChatMessage'],
        components: {
            MessengerChatHeader,
            MessengerChatMain,
            MessengerChatForm
        },
        props: {
            oUserAccounts: Object,
            oMessages: Array,
            oLoggedUser: [Object, Array],
            oSelectedUser: [Object, Array],
        },
        computed: {
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
            sendChatMessage: function (oParameters) {
                let oForm = new FormData();
                oForm.append('file', this.file_upload);
                oForm.append('message_to', oParameters.oSelectedUser.id);
                oForm.append('message', oParameters.oChat);
                axios.post('/api/messages/send', oForm)
                    .then(oResponse => {
                        this.$emit('updateChatMessage', oResponse)
                    });
            }
        }
    }
</script>

<style scoped>

</style>
