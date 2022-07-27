<template>
    <div class="messages">
        <ul v-if="typeof(oMessages) !== 'undefined' || oMessages !== null">
            <li v-for="(message, index) in oMessages" :class="getMessageClass(message)">
                <div>
                    <img class="profile" :src="message.sender.image" alt="" />
                    <p>{{ message.message }}<br>
                        <img  v-if="message.image !== null"
                              class="attachment"
                              :style=" (message.image !== null) ? 'margin-top: 5px;' : ''"
                              :src="getMessageImgUrl(message.image)"
                              :alt="message.image">
                    </p>
                </div>
                <small class="text-muted">{{ message.message_sent_time }}</small>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        name: "MessengerChatMain",
        props: {
            oMessages: Array,
            oLoggedUser: [Object, Array],
        },
        methods: {
            getMessageImgUrl: function(sUrl) {
                return window.location.href + '' + sUrl;
            },
            getMessageClass: function (message) {
                if (message.sender_id === this.oLoggedUser.id) {
                    return 'replies'
                }
                if (message.receiver_id === this.oLoggedUser.id) {
                    return 'sent'
                }
            }
        }
    }
</script>

<style scoped>

</style>
