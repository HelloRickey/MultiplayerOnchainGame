// SPDX-License-Identifier: CC0-1.0
pragma solidity >=0.8.0;
import "./Types.sol";

interface IMultiplayerOnchain {
    /**
     * Create a new room.
     * @dev The entity MUST be assigned a unique Id.
     * @return New room id.
     */
    function createRoom() external returns (uint256);

    /**
     * Get the total number of rooms that have been created.
     * @return Total number of rooms.
     */
    function getRoomCount() external view returns (uint256);

    /**
     * Player joins room.
     * @dev The member MUST be assigned a unique Id.
     * @param _roomId is the id of the room.
     * @return Member id.
     */
    function joinRoom(uint256 _roomId) external returns (uint256);

    /**
     * Get the id of a member in a room.
     * @param _roomId is the id of the room.
     * @param _member is the address of a member.
     * @return Member id.
     */
    function getMemberId(uint256 _roomId, address _member)
        external
        view
        returns (uint256);

    /**
     * Check if a member exists in the room.
     * @param _roomId is the id of the room.
     * @param _member is the address of a member.
     * @return true exists, false does not exist.
     */
    function hasMember(uint256 _roomId, address _member)
        external
        view
        returns (bool);

    /**
     * Get all room IDs joined by a member.
     * @param _member is the address of a member.
     * @return An array of room ids.
     */
    function getRoomIds(address _member)
        external
        view
        returns (uint256[] memory);

    /**
     * Get the total number of members in a room.
     * @param _roomId is the id of the room.
     * @return Total members.
     */
    function getMemberCount(uint256 _roomId) external view returns (uint256);

    /**
     * A member sends a message to other members.
     * @dev Define your game logic here and use the content in the message to handle the member's state. The message MUST be assigned a unique Id
     * @param _roomId is the id of the room.
     * @param _to is an array of other member ids.
     * @param _message is the content of the message, encoded by abi.encode.
     * @param _messageTypes is data type array of message content.
     * @return Message id.
     */
    function sendMessage(
        uint256 _roomId,
        uint256[] memory _to,
        bytes memory _message,
        Types.Type[] memory _messageTypes
    ) external returns (uint256);

    /**
     * Get all messages received by a member in the room.
     * @param _roomId is the id of the room.
     * @param _memberId is the id of the member.
     * @return An array of message ids.
     */
    function getMessageIds(uint256 _roomId, uint256 _memberId)
        external
        view
        returns (uint256[] memory);

    /**
     * Get details of a message.
     * @param _roomId is the id of the room.
     * @param _messageId is the id of the message.
     * @return The content of the message.
     * @return Data type array of message content.
     * @return Sender id.
     * @return An array of receiver ids.
     */
    function getMessage(uint256 _roomId, uint256 _messageId)
        external
        view
        returns (
            bytes memory,
            Types.Type[] memory,
            uint256,
            uint256[] memory
        );
}
