package telehx;
import telehx.TeleHxTypes;


class TeleHxMethods {
	public static var telegramAPIURL: String = "https://api.telegram.org/bot";
	
	public static function sendApiRequest(bot: TeleHxBot, method: String, ?params: HxMethodParams<Dynamic>, ?callback: HxApiResponse<Dynamic> -> Void) {
		var requestURL = '${telegramAPIURL}${bot.token}/${method}';
		var requestInstance = new haxe.Http(requestURL);
		requestInstance.setPostData(haxe.Json.stringify(params.params));
        requestInstance.addHeader('Content-Type', 'application/json');
		requestInstance.onData = function(data: String) {
			#if debug
			trace('sendApiRequest: $data');
			#end
			var response: HxApiResponse<Dynamic> = haxe.Json.parse(data);
			callback(response);
		}
        requestInstance.onError = function(data: String) {
            trace('Error: $data');
        }
		requestInstance.request(true);
	}
	
	/*
	 * Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned.
	 */
	public static function getUpdates(bot: TeleHxBot, ?params: HxgetUpdates, ?callback: Array<HxUpdate> -> Void): Void {
		sendApiRequest(bot, "getUpdates", {params: params}, function(response: HxApiResponse<Array<HxUpdate>>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns true.
	 */
	public static function setWebhook(bot: TeleHxBot, ?params: HxsetWebhook, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setWebhook", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. Requires no parameters.
	 */
	public static function deleteWebhook(bot: TeleHxBot, ?params: HxdeleteWebhook, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "deleteWebhook", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
	 */
	public static function getWebhookInfo(bot: TeleHxBot, ?params: HxgetWebhookInfo, ?callback: HxWebhookInfo -> Void): Void {
		sendApiRequest(bot, "getWebhookInfo", {params: params}, function(response: HxApiResponse<HxWebhookInfo>){
			callback(response.result);
		});
	}
	
	/*
	 * A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object.
	 */
	public static function getMe(bot: TeleHxBot, ?params: HxgetMe, ?callback: HxUser -> Void): Void {
		sendApiRequest(bot, "getMe", {params: params}, function(response: HxApiResponse<HxUser>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send text messages. On success, the sent Message is returned.
	 */
	public static function sendMessage(bot: TeleHxBot, ?params: HxsendMessage, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendMessage", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to forward messages of any kind. On success, the sent Message is returned.
	 */
	public static function forwardMessage(bot: TeleHxBot, ?params: HxforwardMessage, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "forwardMessage", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send photos. On success, the sent Message is returned.
	 */
	public static function sendPhoto(bot: TeleHxBot, ?params: HxsendPhoto, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendPhoto", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .mp3 format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
	 */
	public static function sendAudio(bot: TeleHxBot, ?params: HxsendAudio, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendAudio", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
	 */
	public static function sendDocument(bot: TeleHxBot, ?params: HxsendDocument, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendDocument", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send video files, Telegram clients support mp4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future.
	 */
	public static function sendVideo(bot: TeleHxBot, ?params: HxsendVideo, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendVideo", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future.
	 */
	public static function sendVoice(bot: TeleHxBot, ?params: HxsendVoice, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendVoice", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * As of v.4.0, Telegram clients support rounded square mp4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.
	 */
	public static function sendVideoNote(bot: TeleHxBot, ?params: HxsendVideoNote, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendVideoNote", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send a group of photos or videos as an album. On success, an array of the sent Messages is returned.
	 */
	public static function sendMediaGroup(bot: TeleHxBot, ?params: HxsendMediaGroup, ?callback: Array<HxMessage> -> Void): Void {
		sendApiRequest(bot, "sendMediaGroup", {params: params}, function(response: HxApiResponse<Array<HxMessage>>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send point on the map. On success, the sent Message is returned.
	 */
	public static function sendLocation(bot: TeleHxBot, ?params: HxsendLocation, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendLocation", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to edit live location messages sent by the bot or via the bot (for inline bots). A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned.
	 */
	public static function editMessageLiveLocation(bot: TeleHxBot, ?params: HxeditMessageLiveLocation, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "editMessageLiveLocation", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to stop updating a live location message sent by the bot or via the bot (for inline bots) before live_period expires. On success, if the message was sent by the bot, the sent Message is returned, otherwise True is returned.
	 */
	public static function stopMessageLiveLocation(bot: TeleHxBot, ?params: HxstopMessageLiveLocation, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "stopMessageLiveLocation", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send information about a venue. On success, the sent Message is returned.
	 */
	public static function sendVenue(bot: TeleHxBot, ?params: HxsendVenue, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendVenue", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send phone contacts. On success, the sent Message is returned.
	 */
	public static function sendContact(bot: TeleHxBot, ?params: HxsendContact, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendContact", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
	 */
	public static function sendChatAction(bot: TeleHxBot, ?params: HxsendChatAction, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "sendChatAction", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
	 */
	public static function getUserProfilePhotos(bot: TeleHxBot, ?params: HxgetUserProfilePhotos, ?callback: HxUserProfilePhotos -> Void): Void {
		sendApiRequest(bot, "getUserProfilePhotos", {params: params}, function(response: HxApiResponse<HxUserProfilePhotos>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get basic info about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
	 */
	public static function getFile(bot: TeleHxBot, ?params: HxgetFile, ?callback: HxFile -> Void): Void {
		sendApiRequest(bot, "getFile", {params: params}, function(response: HxApiResponse<HxFile>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to kick a user from a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	 */
	public static function kickChatMember(bot: TeleHxBot, ?params: HxkickChatMember, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "kickChatMember", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success.
	 */
	public static function unbanChatMember(bot: TeleHxBot, ?params: HxunbanChatMember, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "unbanChatMember", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate admin rights. Pass True for all boolean parameters to lift restrictions from a user. Returns True on success.
	 */
	public static function restrictChatMember(bot: TeleHxBot, ?params: HxrestrictChatMember, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "restrictChatMember", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Pass False for all boolean parameters to demote a user. Returns True on success.
	 */
	public static function promoteChatMember(bot: TeleHxBot, ?params: HxpromoteChatMember, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "promoteChatMember", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to generate a new invite link for a chat; any previously generated link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns the new invite link as String on success.
	 */
	public static function exportChatInviteLink(bot: TeleHxBot, ?params: HxexportChatInviteLink, ?callback: String -> Void): Void {
		sendApiRequest(bot, "exportChatInviteLink", {params: params}, function(response: HxApiResponse<String>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success. 
	 */
	public static function setChatPhoto(bot: TeleHxBot, ?params: HxsetChatPhoto, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setChatPhoto", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success. 
	 */
	public static function deleteChatPhoto(bot: TeleHxBot, ?params: HxdeleteChatPhoto, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "deleteChatPhoto", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success. 
	 */
	public static function setChatTitle(bot: TeleHxBot, ?params: HxsetChatTitle, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setChatTitle", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to change the description of a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success. 
	 */
	public static function setChatDescription(bot: TeleHxBot, ?params: HxsetChatDescription, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setChatDescription", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to pin a message in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success.
	 */
	public static function pinChatMessage(bot: TeleHxBot, ?params: HxpinChatMessage, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "pinChatMessage", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to unpin a message in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success. 
	 */
	public static function unpinChatMessage(bot: TeleHxBot, ?params: HxunpinChatMessage, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "unpinChatMessage", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
	 */
	public static function leaveChat(bot: TeleHxBot, ?params: HxleaveChat, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "leaveChat", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.
	 */
	public static function getChat(bot: TeleHxBot, ?params: HxgetChat, ?callback: HxChat -> Void): Void {
		sendApiRequest(bot, "getChat", {params: params}, function(response: HxApiResponse<HxChat>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned.
	 */
	public static function getChatAdministrators(bot: TeleHxBot, ?params: HxgetChatAdministrators, ?callback: Array<HxChatMember> -> Void): Void {
		sendApiRequest(bot, "getChatAdministrators", {params: params}, function(response: HxApiResponse<Array<HxChatMember>>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get the number of members in a chat. Returns Int on success.
	 */
	public static function getChatMembersCount(bot: TeleHxBot, ?params: HxgetChatMembersCount, ?callback: Int -> Void): Void {
		sendApiRequest(bot, "getChatMembersCount", {params: params}, function(response: HxApiResponse<Int>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get information about a member of a chat. Returns a ChatMember object on success.
	 */
	public static function getChatMember(bot: TeleHxBot, ?params: HxgetChatMember, ?callback: HxChatMember -> Void): Void {
		sendApiRequest(bot, "getChatMember", {params: params}, function(response: HxApiResponse<HxChatMember>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	 */
	public static function setChatStickerSet(bot: TeleHxBot, ?params: HxsetChatStickerSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setChatStickerSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	 */
	public static function deleteChatStickerSet(bot: TeleHxBot, ?params: HxdeleteChatStickerSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "deleteChatStickerSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
	 */
	public static function answerCallbackQuery(bot: TeleHxBot, ?params: HxanswerCallbackQuery, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "answerCallbackQuery", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to edit text and game messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	 */
	public static function editMessageText(bot: TeleHxBot, ?params: HxeditMessageText, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "editMessageText", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to edit captions of messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	 */
	public static function editMessageCaption(bot: TeleHxBot, ?params: HxeditMessageCaption, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "editMessageCaption", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to edit only the reply markup of messages sent by the bot or via the bot (for inline bots).  On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	 */
	public static function editMessageReplyMarkup(bot: TeleHxBot, ?params: HxeditMessageReplyMarkup, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "editMessageReplyMarkup", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Bots can delete outgoing messages in groups and supergroups.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.Returns True on success.
	 */
	public static function deleteMessage(bot: TeleHxBot, ?params: HxdeleteMessage, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "deleteMessage", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send .webp stickers. On success, the sent Message is returned.
	 */
	public static function sendSticker(bot: TeleHxBot, ?params: HxsendSticker, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendSticker", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get a sticker set. On success, a StickerSet object is returned.
	 */
	public static function getStickerSet(bot: TeleHxBot, ?params: HxgetStickerSet, ?callback: HxStickerSet -> Void): Void {
		sendApiRequest(bot, "getStickerSet", {params: params}, function(response: HxApiResponse<HxStickerSet>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to upload a .png file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success.
	 */
	public static function uploadStickerFile(bot: TeleHxBot, ?params: HxuploadStickerFile, ?callback: HxFile -> Void): Void {
		sendApiRequest(bot, "uploadStickerFile", {params: params}, function(response: HxApiResponse<HxFile>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to create new sticker set owned by a user. The bot will be able to edit the created sticker set. Returns True on success.
	 */
	public static function createNewStickerSet(bot: TeleHxBot, ?params: HxcreateNewStickerSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "createNewStickerSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to add a new sticker to a set created by the bot. Returns True on success.
	 */
	public static function addStickerToSet(bot: TeleHxBot, ?params: HxaddStickerToSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "addStickerToSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to move a sticker in a set created by the bot to a specific position . Returns True on success.
	 */
	public static function setStickerPositionInSet(bot: TeleHxBot, ?params: HxsetStickerPositionInSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "setStickerPositionInSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to delete a sticker from a set created by the bot. Returns True on success.
	 */
	public static function deleteStickerFromSet(bot: TeleHxBot, ?params: HxdeleteStickerFromSet, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "deleteStickerFromSet", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed.
	 */
	public static function answerInlineQuery(bot: TeleHxBot, ?params: HxanswerInlineQuery, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "answerInlineQuery", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send invoices. On success, the sent Message is returned.
	 */
	public static function sendInvoice(bot: TeleHxBot, ?params: HxsendInvoice, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendInvoice", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
	 */
	public static function answerShippingQuery(bot: TeleHxBot, ?params: HxanswerShippingQuery, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "answerShippingQuery", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
	 */
	public static function answerPreCheckoutQuery(bot: TeleHxBot, ?params: HxanswerPreCheckoutQuery, ?callback: Bool -> Void): Void {
		sendApiRequest(bot, "answerPreCheckoutQuery", {params: params}, function(response: HxApiResponse<Bool>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to send a game. On success, the sent Message is returned.
	 */
	public static function sendGame(bot: TeleHxBot, ?params: HxsendGame, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "sendGame", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to set the score of the specified user in a game. On success, if the message was sent by the bot, returns the edited Message, otherwise returns True. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.
	 */
	public static function setGameScore(bot: TeleHxBot, ?params: HxsetGameScore, ?callback: HxMessage -> Void): Void {
		sendApiRequest(bot, "setGameScore", {params: params}, function(response: HxApiResponse<HxMessage>){
			callback(response.result);
		});
	}
	
	/*
	 * Use this method to get data for high score tables. Will return the score of the specified user and several of his neighbors in a game. On success, returns an Array of GameHighScore objects.
	 */
	public static function getGameHighScores(bot: TeleHxBot, ?params: HxgetGameHighScores, ?callback: Array<HxGameHighScore> -> Void): Void {
		sendApiRequest(bot, "getGameHighScores", {params: params}, function(response: HxApiResponse<Array<HxGameHighScore>>){
			callback(response.result);
		});
	}
}

/*
 * Parent of all method's parameter definitions.
 */
typedef HxMethodParams<T> = {
	params: T,
}


/*
 * Parameter typedef for method getUpdates
 */
typedef HxgetUpdates = {

	/*
	 * Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
	 */
	?offset : Int,

	/*
	 * Limits the number of updates to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	 */
	?limit : Int,

	/*
	 * Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
	 */
	?timeout : Int,

	/*
	 * List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
	 */
	?allowed_updates : Array<String>,
}

/*
 * Parameter typedef for method setWebhook
 */
typedef HxsetWebhook = {

	/*
	 * HTTPS url to send updates to. Use an empty string to remove webhook integration
	 */
	url : String,

	/*
	 * Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
	 */
	?certificate : HxInputFile,

	/*
	 * Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot‘s server, and higher values to increase your bot’s throughput.
	 */
	?max_connections : Int,

	/*
	 * List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
	 */
	?allowed_updates : Array<String>,
}

/*
 * Parameter typedef for method deleteWebhook
 */
typedef HxdeleteWebhook = {
}

/*
 * Parameter typedef for method getWebhookInfo
 */
typedef HxgetWebhookInfo = {
}

/*
 * Parameter typedef for method getMe
 */
typedef HxgetMe = {
}

/*
 * Parameter typedef for method sendMessage
 */
typedef HxsendMessage = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Text of the message to be sent
	 */
	text : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	 */
	?parse_mode : String,

	/*
	 * Disables link previews for links in this message
	 */
	?disable_web_page_preview : Bool,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method forwardMessage
 */
typedef HxforwardMessage = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	 */
	from_chat_id : Dynamic,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * Message identifier in the chat specified in from_chat_id
	 */
	message_id : Int,
}

/*
 * Parameter typedef for method sendPhoto
 */
typedef HxsendPhoto = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data. More info on Sending Files »
	 */
	photo : Dynamic,

	/*
	 * Photo caption (may also be used when resending photos by file_id), 0-200 characters
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendAudio
 */
typedef HxsendAudio = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	audio : Dynamic,

	/*
	 * Audio caption, 0-200 characters
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * Duration of the audio in seconds
	 */
	?duration : Int,

	/*
	 * Performer
	 */
	?performer : String,

	/*
	 * Track name
	 */
	?title : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendDocument
 */
typedef HxsendDocument = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * File to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	document : Dynamic,

	/*
	 * Document caption (may also be used when resending documents by file_id), 0-200 characters
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendVideo
 */
typedef HxsendVideo = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Video to send. Pass a file_id as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart/form-data. More info on Sending Files »
	 */
	video : Dynamic,

	/*
	 * Duration of sent video in seconds
	 */
	?duration : Int,

	/*
	 * Video width
	 */
	?width : Int,

	/*
	 * Video height
	 */
	?height : Int,

	/*
	 * Video caption (may also be used when resending videos by file_id), 0-200 characters
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * Pass True, if the uploaded video is suitable for streaming
	 */
	?supports_streaming : Bool,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendVoice
 */
typedef HxsendVoice = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Audio file to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	voice : Dynamic,

	/*
	 * Voice message caption, 0-200 characters
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * Duration of the voice message in seconds
	 */
	?duration : Int,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendVideoNote
 */
typedef HxsendVideoNote = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Video note to send. Pass a file_id as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More info on Sending Files ». Sending video notes by a URL is currently unsupported
	 */
	video_note : Dynamic,

	/*
	 * Duration of sent video in seconds
	 */
	?duration : Int,

	/*
	 * Video width and height
	 */
	?length : Int,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendMediaGroup
 */
typedef HxsendMediaGroup = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * A JSON-serialized array describing photos and videos to be sent, must include 2–10 items
	 */
	media : Array<HxInputMedia>,

	/*
	 * Sends the messages silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the messages are a reply, ID of the original message
	 */
	?reply_to_message_id : Int,
}

/*
 * Parameter typedef for method sendLocation
 */
typedef HxsendLocation = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Latitude of the location
	 */
	latitude : Float,

	/*
	 * Longitude of the location
	 */
	longitude : Float,

	/*
	 * Period in seconds for which the location will be updated (see Live Locations, should be between 60 and 86400.
	 */
	?live_period : Int,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method editMessageLiveLocation
 */
typedef HxeditMessageLiveLocation = {

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	?chat_id : Dynamic,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,

	/*
	 * Latitude of new location
	 */
	latitude : Float,

	/*
	 * Longitude of new location
	 */
	longitude : Float,

	/*
	 * A JSON-serialized object for a new inline keyboard.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method stopMessageLiveLocation
 */
typedef HxstopMessageLiveLocation = {

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	?chat_id : Dynamic,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,

	/*
	 * A JSON-serialized object for a new inline keyboard.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method sendVenue
 */
typedef HxsendVenue = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Latitude of the venue
	 */
	latitude : Float,

	/*
	 * Longitude of the venue
	 */
	longitude : Float,

	/*
	 * Name of the venue
	 */
	title : String,

	/*
	 * Address of the venue
	 */
	address : String,

	/*
	 * Foursquare identifier of the venue
	 */
	?foursquare_id : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendContact
 */
typedef HxsendContact = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Contact's phone number
	 */
	phone_number : String,

	/*
	 * Contact's first name
	 */
	first_name : String,

	/*
	 * Contact's last name
	 */
	?last_name : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method sendChatAction
 */
typedef HxsendChatAction = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_audio or upload_audio for audio files, upload_document for general files, find_location for location data, record_video_note or upload_video_note for video notes.
	 */
	action : String,
}

/*
 * Parameter typedef for method getUserProfilePhotos
 */
typedef HxgetUserProfilePhotos = {

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,

	/*
	 * Sequential number of the first photo to be returned. By default, all photos are returned.
	 */
	?offset : Int,

	/*
	 * Limits the number of photos to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	 */
	?limit : Int,
}

/*
 * Parameter typedef for method getFile
 */
typedef HxgetFile = {

	/*
	 * File identifier to get info about
	 */
	file_id : String,
}

/*
 * Parameter typedef for method kickChatMember
 */
typedef HxkickChatMember = {

	/*
	 * Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,

	/*
	 * Date when the user will be unbanned, unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever
	 */
	?until_date : Int,
}

/*
 * Parameter typedef for method unbanChatMember
 */
typedef HxunbanChatMember = {

	/*
	 * Unique identifier for the target group or username of the target supergroup or channel (in the format @username)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,
}

/*
 * Parameter typedef for method restrictChatMember
 */
typedef HxrestrictChatMember = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,

	/*
	 * Date when restrictions will be lifted for the user, unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
	 */
	?until_date : Int,

	/*
	 * Pass True, if the user can send text messages, contacts, locations and venues
	 */
	?can_send_messages : Bool,

	/*
	 * Pass True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
	 */
	?can_send_media_messages : Bool,

	/*
	 * Pass True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages
	 */
	?can_send_other_messages : Bool,

	/*
	 * Pass True, if the user may add web page previews to their messages, implies can_send_media_messages
	 */
	?can_add_web_page_previews : Bool,
}

/*
 * Parameter typedef for method promoteChatMember
 */
typedef HxpromoteChatMember = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,

	/*
	 * Pass True, if the administrator can change chat title, photo and other settings
	 */
	?can_change_info : Bool,

	/*
	 * Pass True, if the administrator can create channel posts, channels only
	 */
	?can_post_messages : Bool,

	/*
	 * Pass True, if the administrator can edit messages of other users and can pin messages, channels only
	 */
	?can_edit_messages : Bool,

	/*
	 * Pass True, if the administrator can delete messages of other users
	 */
	?can_delete_messages : Bool,

	/*
	 * Pass True, if the administrator can invite new users to the chat
	 */
	?can_invite_users : Bool,

	/*
	 * Pass True, if the administrator can restrict, ban or unban chat members
	 */
	?can_restrict_members : Bool,

	/*
	 * Pass True, if the administrator can pin messages, supergroups only
	 */
	?can_pin_messages : Bool,

	/*
	 * Pass True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by him)
	 */
	?can_promote_members : Bool,
}

/*
 * Parameter typedef for method exportChatInviteLink
 */
typedef HxexportChatInviteLink = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method setChatPhoto
 */
typedef HxsetChatPhoto = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * New chat photo, uploaded using multipart/form-data
	 */
	photo : HxInputFile,
}

/*
 * Parameter typedef for method deleteChatPhoto
 */
typedef HxdeleteChatPhoto = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method setChatTitle
 */
typedef HxsetChatTitle = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * New chat title, 1-255 characters
	 */
	title : String,
}

/*
 * Parameter typedef for method setChatDescription
 */
typedef HxsetChatDescription = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * New chat description, 0-255 characters
	 */
	?description : String,
}

/*
 * Parameter typedef for method pinChatMessage
 */
typedef HxpinChatMessage = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Identifier of a message to pin
	 */
	message_id : Int,

	/*
	 * Pass True, if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels.
	 */
	?disable_notification : Bool,
}

/*
 * Parameter typedef for method unpinChatMessage
 */
typedef HxunpinChatMessage = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method leaveChat
 */
typedef HxleaveChat = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method getChat
 */
typedef HxgetChat = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method getChatAdministrators
 */
typedef HxgetChatAdministrators = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method getChatMembersCount
 */
typedef HxgetChatMembersCount = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method getChatMember
 */
typedef HxgetChatMember = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Unique identifier of the target user
	 */
	user_id : Int,
}

/*
 * Parameter typedef for method setChatStickerSet
 */
typedef HxsetChatStickerSet = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	 */
	chat_id : Dynamic,

	/*
	 * Name of the sticker set to be set as the group sticker set
	 */
	sticker_set_name : String,
}

/*
 * Parameter typedef for method deleteChatStickerSet
 */
typedef HxdeleteChatStickerSet = {

	/*
	 * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	 */
	chat_id : Dynamic,
}

/*
 * Parameter typedef for method answerCallbackQuery
 */
typedef HxanswerCallbackQuery = {

	/*
	 * Unique identifier for the query to be answered
	 */
	callback_query_id : String,

	/*
	 * Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
	 */
	?text : String,

	/*
	 * If true, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
	 */
	?show_alert : Bool,

	/*
	 * URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @Botfather, specify the URL that opens your game – note that this will only work if the query comes from a callback_game button.Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
	 */
	?url : String,

	/*
	 * The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
	 */
	?cache_time : Int,
}

/*
 * Parameter typedef for method editMessageText
 */
typedef HxeditMessageText = {

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	?chat_id : Dynamic,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,

	/*
	 * New text of the message
	 */
	text : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	 */
	?parse_mode : String,

	/*
	 * Disables link previews for links in this message
	 */
	?disable_web_page_preview : Bool,

	/*
	 * A JSON-serialized object for an inline keyboard.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method editMessageCaption
 */
typedef HxeditMessageCaption = {

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	?chat_id : Dynamic,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,

	/*
	 * New caption of the message
	 */
	?caption : String,

	/*
	 * Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	?parse_mode : String,

	/*
	 * A JSON-serialized object for an inline keyboard.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method editMessageReplyMarkup
 */
typedef HxeditMessageReplyMarkup = {

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	?chat_id : Dynamic,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,

	/*
	 * A JSON-serialized object for an inline keyboard.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method deleteMessage
 */
typedef HxdeleteMessage = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Identifier of the message to delete
	 */
	message_id : Int,
}

/*
 * Parameter typedef for method sendSticker
 */
typedef HxsendSticker = {

	/*
	 * Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	 */
	chat_id : Dynamic,

	/*
	 * Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .webp file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	sticker : Dynamic,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	 */
	?reply_markup : Dynamic,
}

/*
 * Parameter typedef for method getStickerSet
 */
typedef HxgetStickerSet = {

	/*
	 * Name of the sticker set
	 */
	name : String,
}

/*
 * Parameter typedef for method uploadStickerFile
 */
typedef HxuploadStickerFile = {

	/*
	 * User identifier of sticker file owner
	 */
	user_id : Int,

	/*
	 * Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. More info on Sending Files »
	 */
	png_sticker : HxInputFile,
}

/*
 * Parameter typedef for method createNewStickerSet
 */
typedef HxcreateNewStickerSet = {

	/*
	 * User identifier of created sticker set owner
	 */
	user_id : Int,

	/*
	 * Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only english letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in “_by_<bot username>”. <bot_username> is case insensitive. 1-64 characters.
	 */
	name : String,

	/*
	 * Sticker set title, 1-64 characters
	 */
	title : String,

	/*
	 * Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	png_sticker : Dynamic,

	/*
	 * One or more emoji corresponding to the sticker
	 */
	emojis : String,

	/*
	 * Pass True, if a set of mask stickers should be created
	 */
	?contains_masks : Bool,

	/*
	 * A JSON-serialized object for position where the mask should be placed on faces
	 */
	?mask_position : HxMaskPosition,
}

/*
 * Parameter typedef for method addStickerToSet
 */
typedef HxaddStickerToSet = {

	/*
	 * User identifier of sticker set owner
	 */
	user_id : Int,

	/*
	 * Sticker set name
	 */
	name : String,

	/*
	 * Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	 */
	png_sticker : Dynamic,

	/*
	 * One or more emoji corresponding to the sticker
	 */
	emojis : String,

	/*
	 * A JSON-serialized object for position where the mask should be placed on faces
	 */
	?mask_position : HxMaskPosition,
}

/*
 * Parameter typedef for method setStickerPositionInSet
 */
typedef HxsetStickerPositionInSet = {

	/*
	 * File identifier of the sticker
	 */
	sticker : String,

	/*
	 * New sticker position in the set, zero-based
	 */
	position : Int,
}

/*
 * Parameter typedef for method deleteStickerFromSet
 */
typedef HxdeleteStickerFromSet = {

	/*
	 * File identifier of the sticker
	 */
	sticker : String,
}

/*
 * Parameter typedef for method answerInlineQuery
 */
typedef HxanswerInlineQuery = {

	/*
	 * Unique identifier for the answered query
	 */
	inline_query_id : String,

	/*
	 * A JSON-serialized array of results for the inline query
	 */
	results : Array<HxInlineQueryResult>,

	/*
	 * The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
	 */
	?cache_time : Int,

	/*
	 * Pass True, if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
	 */
	?is_personal : Bool,

	/*
	 * Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don‘t support pagination. Offset length can’t exceed 64 bytes.
	 */
	?next_offset : String,

	/*
	 * If passed, clients will display a button with specified text that switches the user to a private chat with the bot and sends the bot a start message with the parameter switch_pm_parameter
	 */
	?switch_pm_text : String,

	/*
	 * Deep-linking parameter for the /start message sent to the bot when user presses the switch button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a ‘Connect your YouTube account’ button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an oauth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
	 */
	?switch_pm_parameter : String,
}

/*
 * Parameter typedef for method sendInvoice
 */
typedef HxsendInvoice = {

	/*
	 * Unique identifier for the target private chat
	 */
	chat_id : Int,

	/*
	 * Product name, 1-32 characters
	 */
	title : String,

	/*
	 * Product description, 1-255 characters
	 */
	description : String,

	/*
	 * Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
	 */
	payload : String,

	/*
	 * Payments provider token, obtained via Botfather
	 */
	provider_token : String,

	/*
	 * Unique deep-linking parameter that can be used to generate this invoice when used as a start parameter
	 */
	start_parameter : String,

	/*
	 * Three-letter ISO 4217 currency code, see more on currencies
	 */
	currency : String,

	/*
	 * Price breakdown, a list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
	 */
	prices : Array<HxLabeledPrice>,

	/*
	 * JSON-encoded data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
	 */
	?provider_data : String,

	/*
	 * URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
	 */
	?photo_url : String,

	/*
	 * Photo size
	 */
	?photo_size : Int,

	/*
	 * Photo width
	 */
	?photo_width : Int,

	/*
	 * Photo height
	 */
	?photo_height : Int,

	/*
	 * Pass True, if you require the user's full name to complete the order
	 */
	?need_name : Bool,

	/*
	 * Pass True, if you require the user's phone number to complete the order
	 */
	?need_phone_number : Bool,

	/*
	 * Pass True, if you require the user's email address to complete the order
	 */
	?need_email : Bool,

	/*
	 * Pass True, if you require the user's shipping address to complete the order
	 */
	?need_shipping_address : Bool,

	/*
	 * Pass True, if user's phone number should be sent to provider
	 */
	?send_phone_number_to_provider : Bool,

	/*
	 * Pass True, if user's email address should be sent to provider
	 */
	?send_email_to_provider : Bool,

	/*
	 * Pass True, if the final price depends on the shipping method
	 */
	?is_flexible : Bool,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method answerShippingQuery
 */
typedef HxanswerShippingQuery = {

	/*
	 * Unique identifier for the query to be answered
	 */
	shipping_query_id : String,

	/*
	 * Specify True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
	 */
	ok : Bool,

	/*
	 * Required if ok is True. A JSON-serialized array of available shipping options.
	 */
	?shipping_options : Array<HxShippingOption>,

	/*
	 * Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. "Sorry, delivery to your desired address is unavailable'). Telegram will display this message to the user.
	 */
	?error_message : String,
}

/*
 * Parameter typedef for method answerPreCheckoutQuery
 */
typedef HxanswerPreCheckoutQuery = {

	/*
	 * Unique identifier for the query to be answered
	 */
	pre_checkout_query_id : String,

	/*
	 * Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
	 */
	ok : Bool,

	/*
	 * Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
	 */
	?error_message : String,
}

/*
 * Parameter typedef for method sendGame
 */
typedef HxsendGame = {

	/*
	 * Unique identifier for the target chat
	 */
	chat_id : Int,

	/*
	 * Short name of the game, serves as the unique identifier for the game. Set up your games via Botfather.
	 */
	game_short_name : String,

	/*
	 * Sends the message silently. Users will receive a notification with no sound.
	 */
	?disable_notification : Bool,

	/*
	 * If the message is a reply, ID of the original message
	 */
	?reply_to_message_id : Int,

	/*
	 * A JSON-serialized object for an inline keyboard. If empty, one ‘Play game_title’ button will be shown. If not empty, the first button must launch the game.
	 */
	?reply_markup : HxInlineKeyboardMarkup,
}

/*
 * Parameter typedef for method setGameScore
 */
typedef HxsetGameScore = {

	/*
	 * User identifier
	 */
	user_id : Int,

	/*
	 * New score, must be non-negative
	 */
	score : Int,

	/*
	 * Pass True, if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
	 */
	?force : Bool,

	/*
	 * Pass True, if the game message should not be automatically edited to include the current scoreboard
	 */
	?disable_edit_message : Bool,

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat
	 */
	?chat_id : Int,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,
}

/*
 * Parameter typedef for method getGameHighScores
 */
typedef HxgetGameHighScores = {

	/*
	 * Target user id
	 */
	user_id : Int,

	/*
	 * Required if inline_message_id is not specified. Unique identifier for the target chat
	 */
	?chat_id : Int,

	/*
	 * Required if inline_message_id is not specified. Identifier of the sent message
	 */
	?message_id : Int,

	/*
	 * Required if chat_id and message_id are not specified. Identifier of the inline message
	 */
	?inline_message_id : String,
}
