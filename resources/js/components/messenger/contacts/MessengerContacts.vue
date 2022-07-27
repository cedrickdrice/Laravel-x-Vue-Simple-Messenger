<template>
    <div id="contacts">
        <ul>
            <li v-for="(chat, index) in oChats" :key="chat.id" class="contact" :class="setChatAsActive(chat)"
                @click="$parent.$emit('getSelectChat', chat)"
            >
                <div class="wrap">
                    <span class="contact-status busy"></span>
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
    export default {
        name: "MessengerContacts",
        props: ['oChats', 'oLoggedUser', 'oSelectedUser'],
        emits: ['getSelectChat'],
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

            setChatAsActive: function (chat) {
                if (this.oSelectedUser.length === 0) {
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
