package telehx;


/*
 * Base class that represents a response from telegram.
 */
typedef HxApiResponse<T> = {
    ok: Bool,
    result: T,
}

/*
 * This object represents an incoming update.At most one of the optional parameters can be present in any given update.
 */
typedef HxUpdate = {

	/*
	 * The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
	 */
	update_id: Int,

	/*
	 * Optional. New incoming message of any kind — text, photo, sticker, etc.
	 */
	message: HxApiResponse<HxMessage>,

	/*
	 * Optional. New version of a message that is known to the bot and was edited
	 */
	edited_message: HxApiResponse<HxMessage>,

	/*
	 * Optional. New incoming channel post of any kind — text, photo, sticker, etc.
	 */
	channel_post: HxApiResponse<HxMessage>,

	/*
	 * Optional. New version of a channel post that is known to the bot and was edited
	 */
	edited_channel_post: HxApiResponse<HxMessage>,

	/*
	 * Optional. New incoming inline query
	 */
	inline_query: HxApiResponse<HxInlineQuery>,

	/*
	 * Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
	 */
	chosen_inline_result: HxApiResponse<HxChosenInlineResult>,

	/*
	 * Optional. New incoming callback query
	 */
	callback_query: HxApiResponse<HxCallbackQuery>,

	/*
	 * Optional. New incoming shipping query. Only for invoices with flexible price
	 */
	shipping_query: HxApiResponse<HxShippingQuery>,

	/*
	 * Optional. New incoming pre-checkout query. Contains full information about checkout
	 */
	pre_checkout_query: HxApiResponse<HxPreCheckoutQuery>,
}

/*
 * Contains information about the current status of a webhook.
 */
typedef HxWebhookInfo = {

	/*
	 * Webhook URL, may be empty if webhook is not set up
	 */
	url: String,

	/*
	 * True, if a custom certificate was provided for webhook certificate checks
	 */
	has_custom_certificate: Bool,

	/*
	 * Number of updates awaiting delivery
	 */
	pending_update_count: Int,

	/*
	 * Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
	 */
	last_error_date: Int,

	/*
	 * Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
	 */
	last_error_message: String,

	/*
	 * Optional. Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
	 */
	max_connections: Int,

	/*
	 * Optional. A list of update types the bot is subscribed to. Defaults to all update types
	 */
	allowed_updates: Array<String>,
}

/*
 * This object represents a Telegram user or bot.
 */
typedef HxUser = {

	/*
	 * Unique identifier for this user or bot
	 */
	id: Int,

	/*
	 * True, if this user is a bot
	 */
	is_bot: Bool,

	/*
	 * User‘s or bot’s first name
	 */
	first_name: String,

	/*
	 * Optional. User‘s or bot’s last name
	 */
	last_name: String,

	/*
	 * Optional. User‘s or bot’s username
	 */
	username: String,

	/*
	 * Optional. IETF language tag of the user's language
	 */
	language_code: String,
}

/*
 * This object represents a chat.
 */
typedef HxChat = {

	/*
	 * Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	 */
	id: Int,

	/*
	 * Type of chat, can be either “private”, “group”, “supergroup” or “channel”
	 */
	type: String,

	/*
	 * Optional. Title, for supergroups, channels and group chats
	 */
	title: String,

	/*
	 * Optional. Username, for private chats, supergroups and channels if available
	 */
	username: String,

	/*
	 * Optional. First name of the other party in a private chat
	 */
	first_name: String,

	/*
	 * Optional. Last name of the other party in a private chat
	 */
	last_name: String,

	/*
	 * Optional. True if a group has ‘All Members Are Admins’ enabled.
	 */
	all_members_are_administrators: Bool,

	/*
	 * Optional. Chat photo. Returned only in getChat.
	 */
	photo: HxApiResponse<HxChatPhoto>,

	/*
	 * Optional. Description, for supergroups and channel chats. Returned only in getChat.
	 */
	description: String,

	/*
	 * Optional. Chat invite link, for supergroups and channel chats. Returned only in getChat.
	 */
	invite_link: String,

	/*
	 * Optional. Pinned message, for supergroups and channel chats. Returned only in getChat.
	 */
	pinned_message: HxApiResponse<HxMessage>,

	/*
	 * Optional. For supergroups, name of group sticker set. Returned only in getChat.
	 */
	sticker_set_name: String,

	/*
	 * Optional. True, if the bot can change the group sticker set. Returned only in getChat.
	 */
	can_set_sticker_set: Bool,
}

/*
 * This object represents a message.
 */
typedef HxMessage = {

	/*
	 * Unique message identifier inside this chat
	 */
	message_id: Int,

	/*
	 * Optional. Sender, empty for messages sent to channels
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Date the message was sent in Unix time
	 */
	date: Int,

	/*
	 * Conversation the message belongs to
	 */
	chat: HxApiResponse<HxChat>,

	/*
	 * Optional. For forwarded messages, sender of the original message
	 */
	forward_from: HxApiResponse<HxUser>,

	/*
	 * Optional. For messages forwarded from channels, information about the original channel
	 */
	forward_from_chat: HxApiResponse<HxChat>,

	/*
	 * Optional. For messages forwarded from channels, identifier of the original message in the channel
	 */
	forward_from_message_id: Int,

	/*
	 * Optional. For messages forwarded from channels, signature of the post author if present
	 */
	forward_signature: String,

	/*
	 * Optional. For forwarded messages, date the original message was sent in Unix time
	 */
	forward_date: Int,

	/*
	 * Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
	 */
	reply_to_message: HxApiResponse<HxMessage>,

	/*
	 * Optional. Date the message was last edited in Unix time
	 */
	edit_date: Int,

	/*
	 * Optional. The unique identifier of a media message group this message belongs to
	 */
	media_group_id: String,

	/*
	 * Optional. Signature of the post author for messages in channels
	 */
	author_signature: String,

	/*
	 * Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
	 */
	text: String,

	/*
	 * Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
	 */
	entities: Array<HxApiResponse<HxMessageEntity>>,

	/*
	 * Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
	 */
	caption_entities: Array<HxApiResponse<HxMessageEntity>>,

	/*
	 * Optional. Message is an audio file, information about the file
	 */
	audio: HxApiResponse<HxAudio>,

	/*
	 * Optional. Message is a general file, information about the file
	 */
	document: HxApiResponse<HxDocument>,

	/*
	 * Optional. Message is a game, information about the game. More about games »
	 */
	game: HxApiResponse<HxGame>,

	/*
	 * Optional. Message is a photo, available sizes of the photo
	 */
	photo: Array<HxApiResponse<HxPhotoSize>>,

	/*
	 * Optional. Message is a sticker, information about the sticker
	 */
	sticker: HxApiResponse<HxSticker>,

	/*
	 * Optional. Message is a video, information about the video
	 */
	video: HxApiResponse<HxVideo>,

	/*
	 * Optional. Message is a voice message, information about the file
	 */
	voice: HxApiResponse<HxVoice>,

	/*
	 * Optional. Message is a video note, information about the video message
	 */
	video_note: HxApiResponse<HxVideoNote>,

	/*
	 * Optional. Caption for the audio, document, photo, video or voice, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Message is a shared contact, information about the contact
	 */
	contact: HxApiResponse<HxContact>,

	/*
	 * Optional. Message is a shared location, information about the location
	 */
	location: HxApiResponse<HxLocation>,

	/*
	 * Optional. Message is a venue, information about the venue
	 */
	venue: HxApiResponse<HxVenue>,

	/*
	 * Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
	 */
	new_chat_members: Array<HxApiResponse<HxUser>>,

	/*
	 * Optional. A member was removed from the group, information about them (this member may be the bot itself)
	 */
	left_chat_member: HxApiResponse<HxUser>,

	/*
	 * Optional. A chat title was changed to this value
	 */
	new_chat_title: String,

	/*
	 * Optional. A chat photo was change to this value
	 */
	new_chat_photo: Array<HxApiResponse<HxPhotoSize>>,

	/*
	 * Optional. Service message: the chat photo was deleted
	 */
	delete_chat_photo: Bool,

	/*
	 * Optional. Service message: the group has been created
	 */
	group_chat_created: Bool,

	/*
	 * Optional. Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
	 */
	supergroup_chat_created: Bool,

	/*
	 * Optional. Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
	 */
	channel_chat_created: Bool,

	/*
	 * Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	 */
	migrate_to_chat_id: Int,

	/*
	 * Optional. The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	 */
	migrate_from_chat_id: Int,

	/*
	 * Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
	 */
	pinned_message: HxApiResponse<HxMessage>,

	/*
	 * Optional. Message is an invoice for a payment, information about the invoice. More about payments »
	 */
	invoice: HxApiResponse<HxInvoice>,

	/*
	 * Optional. Message is a service message about a successful payment, information about the payment. More about payments »
	 */
	successful_payment: HxApiResponse<HxSuccessfulPayment>,

	/*
	 * Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
	 */
	connected_website: String,
}

/*
 * This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc. 
 */
typedef HxMessageEntity = {

	/*
	 * Type of the entity. Can be mention (@username), hashtag, bot_command, url, email, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)
	 */
	type: String,

	/*
	 * Offset in UTF-16 code units to the start of the entity
	 */
	offset: Int,

	/*
	 * Length of the entity in UTF-16 code units
	 */
	length: Int,

	/*
	 * Optional. For “text_link” only, url that will be opened after user taps on the text
	 */
	url: String,

	/*
	 * Optional. For “text_mention” only, the mentioned user
	 */
	user: HxApiResponse<HxUser>,
}

/*
 * This object represents one size of a photo or a file / sticker thumbnail.
 */
typedef HxPhotoSize = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Photo width
	 */
	width: Int,

	/*
	 * Photo height
	 */
	height: Int,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents an audio file to be treated as music by the Telegram clients.
 */
typedef HxAudio = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Duration of the audio in seconds as defined by sender
	 */
	duration: Int,

	/*
	 * Optional. Performer of the audio as defined by sender or by audio tags
	 */
	performer: String,

	/*
	 * Optional. Title of the audio as defined by sender or by audio tags
	 */
	title: String,

	/*
	 * Optional. MIME type of the file as defined by sender
	 */
	mime_type: String,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a general file (as opposed to photos, voice messages and audio files).
 */
typedef HxDocument = {

	/*
	 * Unique file identifier
	 */
	file_id: String,

	/*
	 * Optional. Document thumbnail as defined by sender
	 */
	thumb: HxApiResponse<HxPhotoSize>,

	/*
	 * Optional. Original filename as defined by sender
	 */
	file_name: String,

	/*
	 * Optional. MIME type of the file as defined by sender
	 */
	mime_type: String,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a video file.
 */
typedef HxVideo = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Video width as defined by sender
	 */
	width: Int,

	/*
	 * Video height as defined by sender
	 */
	height: Int,

	/*
	 * Duration of the video in seconds as defined by sender
	 */
	duration: Int,

	/*
	 * Optional. Video thumbnail
	 */
	thumb: HxApiResponse<HxPhotoSize>,

	/*
	 * Optional. Mime type of a file as defined by sender
	 */
	mime_type: String,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a voice note.
 */
typedef HxVoice = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Duration of the audio in seconds as defined by sender
	 */
	duration: Int,

	/*
	 * Optional. MIME type of the file as defined by sender
	 */
	mime_type: String,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a video message (available in Telegram apps as of v.4.0).
 */
typedef HxVideoNote = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Video width and height as defined by sender
	 */
	length: Int,

	/*
	 * Duration of the video in seconds as defined by sender
	 */
	duration: Int,

	/*
	 * Optional. Video thumbnail
	 */
	thumb: HxApiResponse<HxPhotoSize>,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a phone contact.
 */
typedef HxContact = {

	/*
	 * Contact's phone number
	 */
	phone_number: String,

	/*
	 * Contact's first name
	 */
	first_name: String,

	/*
	 * Optional. Contact's last name
	 */
	last_name: String,

	/*
	 * Optional. Contact's user identifier in Telegram
	 */
	user_id: Int,
}

/*
 * This object represents a point on the map.
 */
typedef HxLocation = {

	/*
	 * Longitude as defined by sender
	 */
	longitude: Float,

	/*
	 * Latitude as defined by sender
	 */
	latitude: Float,
}

/*
 * This object represents a venue.
 */
typedef HxVenue = {

	/*
	 * Venue location
	 */
	location: HxApiResponse<HxLocation>,

	/*
	 * Name of the venue
	 */
	title: String,

	/*
	 * Address of the venue
	 */
	address: String,

	/*
	 * Optional. Foursquare identifier of the venue
	 */
	foursquare_id: String,
}

/*
 * This object represent a user's profile pictures.
 */
typedef HxUserProfilePhotos = {

	/*
	 * Total number of profile pictures the target user has
	 */
	total_count: Int,

	/*
	 * Requested profile pictures (in up to 4 sizes each)
	 */
	photos: Array<Array<HxApiResponse<HxPhotoSize>>>,
}

/*
 * This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
 */
typedef HxFile = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Optional. File size, if known
	 */
	file_size: Int,

	/*
	 * Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
	 */
	file_path: String,
}

/*
 * This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).
 */
typedef HxReplyKeyboardMarkup = {

	/*
	 * Array of button rows, each represented by an Array of KeyboardButton objects
	 */
	keyboard: Array<Array<HxApiResponse<HxKeyboardButton>>>,

	/*
	 * Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.
	 */
	resize_keyboard: Bool,

	/*
	 * Optional. Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to false.
	 */
	one_time_keyboard: Bool,

	/*
	 * Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user requests to change the bot‘s language, bot replies to the request with a keyboard to select the new language. Other users in the group don’t see the keyboard.
	 */
	selective: Bool,
}

/*
 * This object represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive.
 */
typedef HxKeyboardButton = {

	/*
	 * Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
	 */
	text: String,

	/*
	 * Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only
	 */
	request_contact: Bool,

	/*
	 * Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only
	 */
	request_location: Bool,
}

/*
 * Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).
 */
typedef HxReplyKeyboardRemove = {

	/*
	 * Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)
	 */
	remove_keyboard: Bool,

	/*
	 * Optional. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
	 */
	selective: Bool,
}

/*
 * This object represents an inline keyboard that appears right next to the message it belongs to.
 */
typedef HxInlineKeyboardMarkup = {

	/*
	 * Array of button rows, each represented by an Array of InlineKeyboardButton objects
	 */
	inline_keyboard: Array<Array<HxApiResponse<HxInlineKeyboardButton>>>,
}

/*
 * This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
 */
typedef HxInlineKeyboardButton = {

	/*
	 * Label text on the button
	 */
	text: String,

	/*
	 * Optional. HTTP url to be opened when button is pressed
	 */
	url: String,

	/*
	 * Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
	 */
	callback_data: String,

	/*
	 * Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
	 */
	switch_inline_query: String,

	/*
	 * Optional. If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot’s username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat – good for selecting something from multiple options.
	 */
	switch_inline_query_current_chat: String,

	/*
	 * Optional. Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.
	 */
	callback_game: HxApiResponse<HxCallbackGame>,

	/*
	 * Optional. Specify True, to send a Pay button.NOTE: This type of button must always be the first button in the first row.
	 */
	pay: Bool,
}

/*
 * This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.
 */
typedef HxCallbackQuery = {

	/*
	 * Unique identifier for this query
	 */
	id: String,

	/*
	 * Sender
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
	 */
	message: HxApiResponse<HxMessage>,

	/*
	 * Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
	 */
	inline_message_id: String,

	/*
	 * Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
	 */
	chat_instance: String,

	/*
	 * Optional. Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
	 */
	data: String,

	/*
	 * Optional. Short name of a Game to be returned, serves as the unique identifier for the game
	 */
	game_short_name: String,
}

/*
 * Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.
 */
typedef HxForceReply = {

	/*
	 * Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
	 */
	force_reply: Bool,

	/*
	 * Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
	 */
	selective: Bool,
}

/*
 * This object represents a chat photo.
 */
typedef HxChatPhoto = {

	/*
	 * Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
	 */
	small_file_id: String,

	/*
	 * Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
	 */
	big_file_id: String,
}

/*
 * This object contains information about one member of a chat.
 */
typedef HxChatMember = {

	/*
	 * Information about the user
	 */
	user: HxApiResponse<HxUser>,

	/*
	 * The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
	 */
	status: String,

	/*
	 * Optional. Restricted and kicked only. Date when restrictions will be lifted for this user, unix time
	 */
	until_date: Int,

	/*
	 * Optional. Administrators only. True, if the bot is allowed to edit administrator privileges of that user
	 */
	can_be_edited: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can change the chat title, photo and other settings
	 */
	can_change_info: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can post in the channel, channels only
	 */
	can_post_messages: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can edit messages of other users and can pin messages, channels only
	 */
	can_edit_messages: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can delete messages of other users
	 */
	can_delete_messages: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can invite new users to the chat
	 */
	can_invite_users: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can restrict, ban or unban chat members
	 */
	can_restrict_members: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can pin messages, supergroups only
	 */
	can_pin_messages: Bool,

	/*
	 * Optional. Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
	 */
	can_promote_members: Bool,

	/*
	 * Optional. Restricted only. True, if the user can send text messages, contacts, locations and venues
	 */
	can_send_messages: Bool,

	/*
	 * Optional. Restricted only. True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
	 */
	can_send_media_messages: Bool,

	/*
	 * Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages
	 */
	can_send_other_messages: Bool,

	/*
	 * Optional. Restricted only. True, if user may add web page previews to his messages, implies can_send_media_messages
	 */
	can_add_web_page_previews: Bool,
}

/*
 * Contains information about why a request was unsuccessful.
 */
typedef HxResponseParameters = {

	/*
	 * Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	 */
	migrate_to_chat_id: Int,

	/*
	 * Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
	 */
	retry_after: Int,
}

/*
 * This object represents the content of a media message to be sent. It should be one of
 */
typedef HxInputMedia = {
}

/*
 * Represents a photo to be sent.
 */
typedef HxInputMediaPhoto = {

	/*
	 * Type of the result, must be photo
	 */
	type: String,

	/*
	 * File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »
	 */
	media: String,

	/*
	 * Optional. Caption of the photo to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,
}

/*
 * Represents a video to be sent.
 */
typedef HxInputMediaVideo = {

	/*
	 * Type of the result, must be video
	 */
	type: String,

	/*
	 * File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »
	 */
	media: String,

	/*
	 * Optional. Caption of the video to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Video width
	 */
	width: Int,

	/*
	 * Optional. Video height
	 */
	height: Int,

	/*
	 * Optional. Video duration
	 */
	duration: Int,

	/*
	 * Optional. Pass True, if the uploaded video is suitable for streaming
	 */
	supports_streaming: Bool,
}

/*
 * This object represents the contents of a file to be uploaded. Must be posted using multipart/form-data in the usual way that files are uploaded via the browser.
 */
typedef HxInputFile = {
}

/*
 * This object represents a sticker.
 */
typedef HxSticker = {

	/*
	 * Unique identifier for this file
	 */
	file_id: String,

	/*
	 * Sticker width
	 */
	width: Int,

	/*
	 * Sticker height
	 */
	height: Int,

	/*
	 * Optional. Sticker thumbnail in the .webp or .jpg format
	 */
	thumb: HxApiResponse<HxPhotoSize>,

	/*
	 * Optional. Emoji associated with the sticker
	 */
	emoji: String,

	/*
	 * Optional. Name of the sticker set to which the sticker belongs
	 */
	set_name: String,

	/*
	 * Optional. For mask stickers, the position where the mask should be placed
	 */
	mask_position: HxApiResponse<HxMaskPosition>,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * This object represents a sticker set.
 */
typedef HxStickerSet = {

	/*
	 * Sticker set name
	 */
	name: String,

	/*
	 * Sticker set title
	 */
	title: String,

	/*
	 * True, if the sticker set contains masks
	 */
	contains_masks: Bool,

	/*
	 * List of all set stickers
	 */
	stickers: Array<HxApiResponse<HxSticker>>,
}

/*
 * This object describes the position on faces where a mask should be placed by default.
 */
typedef HxMaskPosition = {

	/*
	 * The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
	 */
	point: String,

	/*
	 * Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
	 */
	x_shift: Float,

	/*
	 * Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
	 */
	y_shift: Float,

	/*
	 * Mask scaling coefficient. For example, 2.0 means double size.
	 */
	scale: Float,
}

/*
 * This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
 */
typedef HxInlineQuery = {

	/*
	 * Unique identifier for this query
	 */
	id: String,

	/*
	 * Sender
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Optional. Sender location, only for bots that request user location
	 */
	location: HxApiResponse<HxLocation>,

	/*
	 * Text of the query (up to 512 characters)
	 */
	query: String,

	/*
	 * Offset of the results to be returned, can be controlled by the bot
	 */
	offset: String,
}

/*
 * This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:
 */
typedef HxInlineQueryResult = {
}

/*
 * Represents a link to an article or web page.
 */
typedef HxInlineQueryResultArticle = {

	/*
	 * Type of the result, must be article
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 Bytes
	 */
	id: String,

	/*
	 * Title of the result
	 */
	title: String,

	/*
	 * Content of the message to be sent
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. URL of the result
	 */
	url: String,

	/*
	 * Optional. Pass True, if you don't want the URL to be shown in the message
	 */
	hide_url: Bool,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Url of the thumbnail for the result
	 */
	thumb_url: String,

	/*
	 * Optional. Thumbnail width
	 */
	thumb_width: Int,

	/*
	 * Optional. Thumbnail height
	 */
	thumb_height: Int,
}

/*
 * Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
 */
typedef HxInlineQueryResultPhoto = {

	/*
	 * Type of the result, must be photo
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB
	 */
	photo_url: String,

	/*
	 * URL of the thumbnail for the photo
	 */
	thumb_url: String,

	/*
	 * Optional. Width of the photo
	 */
	photo_width: Int,

	/*
	 * Optional. Height of the photo
	 */
	photo_height: Int,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Caption of the photo to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the photo
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
 */
typedef HxInlineQueryResultGif = {

	/*
	 * Type of the result, must be gif
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL for the GIF file. File size must not exceed 1MB
	 */
	gif_url: String,

	/*
	 * Optional. Width of the GIF
	 */
	gif_width: Int,

	/*
	 * Optional. Height of the GIF
	 */
	gif_height: Int,

	/*
	 * Optional. Duration of the GIF
	 */
	gif_duration: Int,

	/*
	 * URL of the static thumbnail for the result (jpeg or gif)
	 */
	thumb_url: String,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the GIF file to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the GIF animation
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
 */
typedef HxInlineQueryResultMpeg4Gif = {

	/*
	 * Type of the result, must be mpeg4_gif
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL for the MP4 file. File size must not exceed 1MB
	 */
	mpeg4_url: String,

	/*
	 * Optional. Video width
	 */
	mpeg4_width: Int,

	/*
	 * Optional. Video height
	 */
	mpeg4_height: Int,

	/*
	 * Optional. Video duration
	 */
	mpeg4_duration: Int,

	/*
	 * URL of the static thumbnail (jpeg or gif) for the result
	 */
	thumb_url: String,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the video animation
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
 */
typedef HxInlineQueryResultVideo = {

	/*
	 * Type of the result, must be video
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL for the embedded video player or video file
	 */
	video_url: String,

	/*
	 * Mime type of the content of video url, “text/html” or “video/mp4”
	 */
	mime_type: String,

	/*
	 * URL of the thumbnail (jpeg only) for the video
	 */
	thumb_url: String,

	/*
	 * Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the video to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Video width
	 */
	video_width: Int,

	/*
	 * Optional. Video height
	 */
	video_height: Int,

	/*
	 * Optional. Video duration in seconds
	 */
	video_duration: Int,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to an mp3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
 */
typedef HxInlineQueryResultAudio = {

	/*
	 * Type of the result, must be audio
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL for the audio file
	 */
	audio_url: String,

	/*
	 * Title
	 */
	title: String,

	/*
	 * Optional. Caption, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Performer
	 */
	performer: String,

	/*
	 * Optional. Audio duration in seconds
	 */
	audio_duration: Int,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the audio
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a voice recording in an .ogg container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.
 */
typedef HxInlineQueryResultVoice = {

	/*
	 * Type of the result, must be voice
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid URL for the voice recording
	 */
	voice_url: String,

	/*
	 * Recording title
	 */
	title: String,

	/*
	 * Optional. Caption, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Recording duration in seconds
	 */
	voice_duration: Int,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the voice recording
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.
 */
typedef HxInlineQueryResultDocument = {

	/*
	 * Type of the result, must be document
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the document to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * A valid URL for the file
	 */
	document_url: String,

	/*
	 * Mime type of the content of the file, either “application/pdf” or “application/zip”
	 */
	mime_type: String,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the file
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,

	/*
	 * Optional. URL of the thumbnail (jpeg only) for the file
	 */
	thumb_url: String,

	/*
	 * Optional. Thumbnail width
	 */
	thumb_width: Int,

	/*
	 * Optional. Thumbnail height
	 */
	thumb_height: Int,
}

/*
 * Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.
 */
typedef HxInlineQueryResultLocation = {

	/*
	 * Type of the result, must be location
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 Bytes
	 */
	id: String,

	/*
	 * Location latitude in degrees
	 */
	latitude: Float,

	/*
	 * Location longitude in degrees
	 */
	longitude: Float,

	/*
	 * Location title
	 */
	title: String,

	/*
	 * Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	 */
	live_period: Int,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the location
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,

	/*
	 * Optional. Url of the thumbnail for the result
	 */
	thumb_url: String,

	/*
	 * Optional. Thumbnail width
	 */
	thumb_width: Int,

	/*
	 * Optional. Thumbnail height
	 */
	thumb_height: Int,
}

/*
 * Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.
 */
typedef HxInlineQueryResultVenue = {

	/*
	 * Type of the result, must be venue
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 Bytes
	 */
	id: String,

	/*
	 * Latitude of the venue location in degrees
	 */
	latitude: Float,

	/*
	 * Longitude of the venue location in degrees
	 */
	longitude: Float,

	/*
	 * Title of the venue
	 */
	title: String,

	/*
	 * Address of the venue
	 */
	address: String,

	/*
	 * Optional. Foursquare identifier of the venue if known
	 */
	foursquare_id: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the venue
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,

	/*
	 * Optional. Url of the thumbnail for the result
	 */
	thumb_url: String,

	/*
	 * Optional. Thumbnail width
	 */
	thumb_width: Int,

	/*
	 * Optional. Thumbnail height
	 */
	thumb_height: Int,
}

/*
 * Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.
 */
typedef HxInlineQueryResultContact = {

	/*
	 * Type of the result, must be contact
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 Bytes
	 */
	id: String,

	/*
	 * Contact's phone number
	 */
	phone_number: String,

	/*
	 * Contact's first name
	 */
	first_name: String,

	/*
	 * Optional. Contact's last name
	 */
	last_name: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the contact
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,

	/*
	 * Optional. Url of the thumbnail for the result
	 */
	thumb_url: String,

	/*
	 * Optional. Thumbnail width
	 */
	thumb_width: Int,

	/*
	 * Optional. Thumbnail height
	 */
	thumb_height: Int,
}

/*
 * Represents a Game.
 */
typedef HxInlineQueryResultGame = {

	/*
	 * Type of the result, must be game
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * Short name of the game
	 */
	game_short_name: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,
}

/*
 * Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
 */
typedef HxInlineQueryResultCachedPhoto = {

	/*
	 * Type of the result, must be photo
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier of the photo
	 */
	photo_file_id: String,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Caption of the photo to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the photo
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.
 */
typedef HxInlineQueryResultCachedGif = {

	/*
	 * Type of the result, must be gif
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier for the GIF file
	 */
	gif_file_id: String,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the GIF file to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the GIF animation
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
 */
typedef HxInlineQueryResultCachedMpeg4Gif = {

	/*
	 * Type of the result, must be mpeg4_gif
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier for the MP4 file
	 */
	mpeg4_file_id: String,

	/*
	 * Optional. Title for the result
	 */
	title: String,

	/*
	 * Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the video animation
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.
 */
typedef HxInlineQueryResultCachedSticker = {

	/*
	 * Type of the result, must be sticker
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier of the sticker
	 */
	sticker_file_id: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the sticker
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file.
 */
typedef HxInlineQueryResultCachedDocument = {

	/*
	 * Type of the result, must be document
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * Title for the result
	 */
	title: String,

	/*
	 * A valid file identifier for the file
	 */
	document_file_id: String,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Caption of the document to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the file
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
 */
typedef HxInlineQueryResultCachedVideo = {

	/*
	 * Type of the result, must be video
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier for the video file
	 */
	video_file_id: String,

	/*
	 * Title for the result
	 */
	title: String,

	/*
	 * Optional. Short description of the result
	 */
	description: String,

	/*
	 * Optional. Caption of the video to be sent, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the video
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.
 */
typedef HxInlineQueryResultCachedVoice = {

	/*
	 * Type of the result, must be voice
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier for the voice message
	 */
	voice_file_id: String,

	/*
	 * Voice message title
	 */
	title: String,

	/*
	 * Optional. Caption, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the voice message
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * Represents a link to an mp3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
 */
typedef HxInlineQueryResultCachedAudio = {

	/*
	 * Type of the result, must be audio
	 */
	type: String,

	/*
	 * Unique identifier for this result, 1-64 bytes
	 */
	id: String,

	/*
	 * A valid file identifier for the audio file
	 */
	audio_file_id: String,

	/*
	 * Optional. Caption, 0-200 characters
	 */
	caption: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	 */
	parse_mode: String,

	/*
	 * Optional. Inline keyboard attached to the message
	 */
	reply_markup: HxApiResponse<HxInlineKeyboardMarkup>,

	/*
	 * Optional. Content of the message to be sent instead of the audio
	 */
	input_message_content: HxApiResponse<HxInputMessageContent>,
}

/*
 * This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 4 types:
 */
typedef HxInputMessageContent = {
}

/*
 * Represents the content of a text message to be sent as the result of an inline query. 
 */
typedef HxInputTextMessageContent = {

	/*
	 * Text of the message to be sent, 1-4096 characters
	 */
	message_text: String,

	/*
	 * Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	 */
	parse_mode: String,

	/*
	 * Optional. Disables link previews for links in the sent message
	 */
	disable_web_page_preview: Bool,
}

/*
 * Represents the content of a location message to be sent as the result of an inline query. 
 */
typedef HxInputLocationMessageContent = {

	/*
	 * Latitude of the location in degrees
	 */
	latitude: Float,

	/*
	 * Longitude of the location in degrees
	 */
	longitude: Float,

	/*
	 * Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	 */
	live_period: Int,
}

/*
 * Represents the content of a venue message to be sent as the result of an inline query. 
 */
typedef HxInputVenueMessageContent = {

	/*
	 * Latitude of the venue in degrees
	 */
	latitude: Float,

	/*
	 * Longitude of the venue in degrees
	 */
	longitude: Float,

	/*
	 * Name of the venue
	 */
	title: String,

	/*
	 * Address of the venue
	 */
	address: String,

	/*
	 * Optional. Foursquare identifier of the venue, if known
	 */
	foursquare_id: String,
}

/*
 * Represents the content of a contact message to be sent as the result of an inline query. 
 */
typedef HxInputContactMessageContent = {

	/*
	 * Contact's phone number
	 */
	phone_number: String,

	/*
	 * Contact's first name
	 */
	first_name: String,

	/*
	 * Optional. Contact's last name
	 */
	last_name: String,
}

/*
 * Represents a result of an inline query that was chosen by the user and sent to their chat partner. 
 */
typedef HxChosenInlineResult = {

	/*
	 * The unique identifier for the result that was chosen
	 */
	result_id: String,

	/*
	 * The user that chose the result
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Optional. Sender location, only for bots that require user location
	 */
	location: HxApiResponse<HxLocation>,

	/*
	 * Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
	 */
	inline_message_id: String,

	/*
	 * The query that was used to obtain the result
	 */
	query: String,
}

/*
 * This object represents a portion of the price for goods or services.
 */
typedef HxLabeledPrice = {

	/*
	 * Portion label
	 */
	label: String,

	/*
	 * Price of the product in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	 */
	amount: Int,
}

/*
 * This object contains basic information about an invoice.
 */
typedef HxInvoice = {

	/*
	 * Product name
	 */
	title: String,

	/*
	 * Product description
	 */
	description: String,

	/*
	 * Unique bot deep-linking parameter that can be used to generate this invoice
	 */
	start_parameter: String,

	/*
	 * Three-letter ISO 4217 currency code
	 */
	currency: String,

	/*
	 * Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	 */
	total_amount: Int,
}

/*
 * This object represents a shipping address.
 */
typedef HxShippingAddress = {

	/*
	 * ISO 3166-1 alpha-2 country code
	 */
	country_code: String,

	/*
	 * State, if applicable
	 */
	state: String,

	/*
	 * City
	 */
	city: String,

	/*
	 * First line for the address
	 */
	street_line1: String,

	/*
	 * Second line for the address
	 */
	street_line2: String,

	/*
	 * Address post code
	 */
	post_code: String,
}

/*
 * This object represents information about an order.
 */
typedef HxOrderInfo = {

	/*
	 * Optional. User name
	 */
	name: String,

	/*
	 * Optional. User's phone number
	 */
	phone_number: String,

	/*
	 * Optional. User email
	 */
	email: String,

	/*
	 * Optional. User shipping address
	 */
	shipping_address: HxApiResponse<HxShippingAddress>,
}

/*
 * This object represents one shipping option.
 */
typedef HxShippingOption = {

	/*
	 * Shipping option identifier
	 */
	id: String,

	/*
	 * Option title
	 */
	title: String,

	/*
	 * List of price portions
	 */
	prices: Array<HxApiResponse<HxLabeledPrice>>,
}

/*
 * This object contains basic information about a successful payment.
 */
typedef HxSuccessfulPayment = {

	/*
	 * Three-letter ISO 4217 currency code
	 */
	currency: String,

	/*
	 * Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	 */
	total_amount: Int,

	/*
	 * Bot specified invoice payload
	 */
	invoice_payload: String,

	/*
	 * Optional. Identifier of the shipping option chosen by the user
	 */
	shipping_option_id: String,

	/*
	 * Optional. Order info provided by the user
	 */
	order_info: HxApiResponse<HxOrderInfo>,

	/*
	 * Telegram payment identifier
	 */
	telegram_payment_charge_id: String,

	/*
	 * Provider payment identifier
	 */
	provider_payment_charge_id: String,
}

/*
 * This object contains information about an incoming shipping query.
 */
typedef HxShippingQuery = {

	/*
	 * Unique query identifier
	 */
	id: String,

	/*
	 * User who sent the query
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Bot specified invoice payload
	 */
	invoice_payload: String,

	/*
	 * User specified shipping address
	 */
	shipping_address: HxApiResponse<HxShippingAddress>,
}

/*
 * This object contains information about an incoming pre-checkout query.
 */
typedef HxPreCheckoutQuery = {

	/*
	 * Unique query identifier
	 */
	id: String,

	/*
	 * User who sent the query
	 */
	from: HxApiResponse<HxUser>,

	/*
	 * Three-letter ISO 4217 currency code
	 */
	currency: String,

	/*
	 * Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	 */
	total_amount: Int,

	/*
	 * Bot specified invoice payload
	 */
	invoice_payload: String,

	/*
	 * Optional. Identifier of the shipping option chosen by the user
	 */
	shipping_option_id: String,

	/*
	 * Optional. Order info provided by the user
	 */
	order_info: HxApiResponse<HxOrderInfo>,
}

/*
 * This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
 */
typedef HxGame = {

	/*
	 * Title of the game
	 */
	title: String,

	/*
	 * Description of the game
	 */
	description: String,

	/*
	 * Photo that will be displayed in the game message in chats.
	 */
	photo: Array<HxApiResponse<HxPhotoSize>>,

	/*
	 * Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
	 */
	text: String,

	/*
	 * Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
	 */
	text_entities: Array<HxApiResponse<HxMessageEntity>>,

	/*
	 * Optional. Animation that will be displayed in the game message in chats. Upload via BotFather
	 */
	animation: HxApiResponse<HxAnimation>,
}

/*
 * You can provide an animation for your game so that it looks stylish in chats (check out Lumberjack for an example). This object represents an animation file to be displayed in the message containing a game.
 */
typedef HxAnimation = {

	/*
	 * Unique file identifier
	 */
	file_id: String,

	/*
	 * Optional. Animation thumbnail as defined by sender
	 */
	thumb: HxApiResponse<HxPhotoSize>,

	/*
	 * Optional. Original animation filename as defined by sender
	 */
	file_name: String,

	/*
	 * Optional. MIME type of the file as defined by sender
	 */
	mime_type: String,

	/*
	 * Optional. File size
	 */
	file_size: Int,
}

/*
 * A placeholder, currently holds no information. Use BotFather to set up your game.
 */
typedef HxCallbackGame = {
}

/*
 * This object represents one row of the high scores table for a game.
 */
typedef HxGameHighScore = {

	/*
	 * Position in high score table for the game
	 */
	position: Int,

	/*
	 * User
	 */
	user: HxApiResponse<HxUser>,

	/*
	 * Score
	 */
	score: Int,
}

