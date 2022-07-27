<template>
    <div class="message-input">
        <div class="wrap">
            <input type="text" placeholder="Write your message..." v-model="chat_message" />
            <button class="submit" @click="sendChatMessageToParent"><fa icon="fa-paper-plane" aria-hidden="true"></fa></button>
            <input
                id="fileUpload"
                ref="fileInput"
                type="file"
                name="file-upload"
                multiple=""
                accept="image/jpeg, image/png"
                @change="onUploadFiles"
                class="d-none">
            <button class="button"
                @click="chooseFileUpload"
            ><fa icon="fa-paperclip" aria-hidden="true"></fa></button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "MessengerChatForm",
        data() {
            return {
                chat_message: '',
                file: '',
            }
        },
        emits: ['sendChatMessage', 'update:modelValue'],
        props: ['oSelectedUser'],
        methods: {
            //Send chat message to MessengerChat.vue
            sendChatMessageToParent: function () {
                if (this.chat_message.length === 0) {
                    return;
                }
                this.$emit('sendChatMessage', { oChat: this.chat_message, oSelectedUser: this.oSelectedUser });
                this.chat_message = '';
            },
            chooseFileUpload: function () {
                document.getElementById("fileUpload").click()
            },
            onUploadFiles: function (event) {
                const input = this.$refs.fileInput;
                const files = input.files;
                if (files && files[0]) {
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        this.imageData = e.target.result;
                    };
                    reader.readAsDataURL(files[0]);
                    this.$emit("update:modelValue", files[0]);
                }
            }
        }
    }
</script>

<style scoped>

</style>
