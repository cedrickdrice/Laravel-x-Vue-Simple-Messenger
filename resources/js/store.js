const state = {
    urls: {
        getCurrentChatList          : '/api/messages/contact/list',
        getCurrentLoggedDetail      : '/api/get-user',
        getSelectedChatUserDetail   : '/api/messages/contact/chat',
        getSearchUserList           : '/api/user/search',
        sendChatMessage             : '/api/messages/send',
    },
    chats : {
        loggedUser      : [],
        selectedUser    : [],
        users           : [],
        messages        : [],
        searchUserList  : []
    },
    community : {
        onlineUser      : []
    }
};

const getters = {
    checkIfNotSelectedUser: state => typeof (state.chats.selectedUser) === "undefined"|| typeof (state.chats.selectedUser) === null || state.chats.selectedUser.length === 0,
    checkIfLoadedOnlineUser: state => typeof (state.community.onlineUser) === "undefined"|| typeof (state.community.onlineUser) === null || state.community.onlineUser.length === 0,
}

const mutations = {
    fetchLoggedUser(state, oLoggedUser) {
        state.chats.loggedUser = oLoggedUser;
    },
    fetchUserList(state, oListUsers) {
        state.chats.users = oListUsers;
    },
    fetchSelectedChatMessages(state, oSelectedChatMessages) {
        state.chats.messages = oSelectedChatMessages;
    },
    fetchSelectedChatUser(state, oSelectedUser) {
        state.chats.selectedUser = oSelectedUser;
    },
    fetchSearchedUserList(state, oSearchUserList) {
        state.chats.searchUserList = oSearchUserList
    },
    updateOnlineUserList(state, oOnlineUserList) {
        state.community.onlineUser = oOnlineUserList
    },
    addOnlineUserList(state, oOnlineUserList) {
        state.community.onlineUser.unshift(oOnlineUserList);
    },
    removeOfflineUserList(state, oOnlineUserList) {
        state.community.onlineUser = state.community.onlineUser.filter(oCurrentUser => {
            return oCurrentUser.id !== oOnlineUserList.id
        });
    },
};

const actions = {
    /**
     * Get previously chatted user
     * @param state
     * @param commit
     * @returns {Promise<unknown>}
     */
    getUserChatList({state, commit}) {
        return new Promise((resolve, reject) => {
            axios.get(state.urls.getCurrentChatList)
                .then(oResponse => {
                    commit('fetchUserList', oResponse.data.list);
                    resolve();
                })
                .catch(function () {
                    reject();
                });
        });
    },
    /**
     * Get current user logged in
     * @param state
     * @param commit
     * @returns {Promise<unknown>}
     */
    getLoggedUserDetail({state, commit}) {
        return new Promise((resolve, reject) => {
            axios.get(state.urls.getCurrentLoggedDetail)
                .then(oResponse => {
                    commit('fetchLoggedUser', oResponse.data.user);
                    resolve();
                })
                .catch(function () {
                    reject();
                });
        });
    },
    getSelectedChatDetail: function ({state, commit, dispatch}, oSelectedChat) {
        return new Promise((resolve, reject) => {
            if (typeof(oSelectedChat.sender_id) === 'undefined' || oSelectedChat.sender_id === null) {
                //When select a user from search
                commit('fetchSelectedChatUser', oSelectedChat);
            } else {
                //When select a user from chat message list
                dispatch('getChatWithDetail', oSelectedChat);
            }

            axios.post(state.urls.getSelectedChatUserDetail, {
                user_id : state.chats.selectedUser.id
            }).then(oResponse => {
                commit('fetchSelectedChatMessages', oResponse.data.messages.message);
                resolve();
            })
                .catch(function (error) {
                    console.log(error);
                    reject();
                })
        });

    },
    /**
     * Get the detail of who are you chatting with
     * @param participant
     * @returns {*}
     */
    getChatWithDetail: function({state, commit}, oChat) {
        var oLoggedUser = state.chats.loggedUser;
        if (typeof(oChat.sender_id) === 'undefined' || oChat.sender_id === null) {
            commit('fetchSelectedChatUser', oChat);
        }
        if (oChat.sender_id !== oLoggedUser.id) {
            commit('fetchSelectedChatUser', oChat.sender);
        }
        if (oChat.receiver_id !== oLoggedUser.id) {
            commit('fetchSelectedChatUser', oChat.receiver);
        }
    },
    /**
     * Get user searched list from api
     * @param state
     * @param commit
     * @param oForm
     * @returns {Promise<unknown>}
     */
    getUserListFromSearch: function({state, commit}, oForm) {
        return new Promise((resolve, reject) => {
            axios.get(state.urls.getSearchUserList, {
                params: oForm
            })
            .then(oResponse => {
                commit('fetchSearchedUserList', oResponse.data.list);
                resolve();
            })
            .catch(function (error) {
                console.log(error);
                reject();
            });
        });
    },
    /**
     * Send Message
     * @param state
     * @param commit
     * @param dispatch
     * @param oForm
     * @returns {Promise<unknown>}
     */
    postSendChatMessage: function ({state, commit, dispatch}, oForm) {
        return new Promise((resolve, reject) => {
            axios.post(state.urls.sendChatMessage, oForm)
                .then(oResponse => {
                    //Removed due to broadcast already handling the append of new message and on chat user list
                    // commit('fetchSelectedChatMessages', oResponse.data.message.message);
                    // dispatch('getUserChatList'); //Update latest message on chat list
                    resolve();
                });
        });
    },
    /**
     * Listen on broadcast chat message, update userchat list and current chat message
     * @param state
     * @param commit
     * @param dispatch
     * @param getters
     * @param oOtherMessage
     */
    getBroadcastChatMessage: function ({state, commit, dispatch, getters}, oOtherMessage) {
        if (getters.checkIfNotSelectedUser !== true) {
            //Prevent update chat message when no current selected chat
            let oUpdatedMessage = state.chats.messages;
            oUpdatedMessage.push(oOtherMessage.message);
            commit('fetchSelectedChatMessages', oUpdatedMessage);
        }
        dispatch('getUserChatList'); //trigger update latest message on chat list
    }
};


export default {
    state,
    getters,
    actions,
    mutations
}
