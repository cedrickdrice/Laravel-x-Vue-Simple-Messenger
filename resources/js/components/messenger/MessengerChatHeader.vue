<template>
    <div v-if="oMessages.length > 0" class="contact-profile">
        <img :src="oSelectedUser.image" alt="" />
        <p>{{ oSelectedUser.name }}</p>
        <div class="social-media">
            <a :href="getFacebookUrl" target="_blank">
                <fa :icon="['fab', 'facebook-f']" class="fa-fw" aria-hidden="true"></fa>
            </a>
            <a  :href="getTwitterUrl" target="_blank">
                <fa :icon="['fab', 'twitter']" class="fa-fw" aria-hidden="true"></fa>
            </a>
            <a  :href="getInstagramUrl" target="_blank">
                <fa :icon="['fab', 'instagram']" class="fa-fw" aria-hidden="true"></fa>
            </a>
        </div>
    </div>
</template>

<script>
    export default {
        name: "MessengerChatHeader",
        props: {
            getFacebookUrl: String,
            getTwitterUrl: String,
            getInstagramUrl: String,
            oMessages: Array,
            oLoggedUser: [Object, Array],
            oSelectedUser: [Object, Array],
        }
    }
</script>

<style scoped>

</style>
