import NIOCore

public enum TFTPOperation: Int, NIOSendable {
	case RRQ = 1, WRQ, DATA, ACK, ERROR
}

public enum TFTPError: Int, NIOSendable {
	case notDefined
	case fileNotFound
	case accessViolation
	case diskFull
	case illegalOperation
	case unknownTransferID
	case fileAlreadyExists
	case noSuchUser
}

extension TFTPError: CustomDebugStringConvertible {
	public var debugDescription: String {
		switch self {
		case .notDefined:
			return "not defined"
		case .fileNotFound:
			return "file not found"
		case .accessViolation:
			return "access violation"
		case .diskFull:
			return "disk full or allocation exceeded"
		case .illegalOperation:
			return "illegal TFTP operation"
		case .unknownTransferID:
			return "unknown transfer ID"
		case .fileAlreadyExists:
			return "file already exists"
		case .noSuchUser:
			return "no such user"
		}
	}
}

public enum TFTPMode: String, NIOSendable {
	case netascii
	case octet
	case mail
}

public struct TFTPRequestPacket {
	public var opcode: TFTPOperation
	public var fileName: String
	public var mode: TFTPMode
}

public struct TFTPDataPacket {
	public var opcode: TFTPOperation
	public var blockNumber: Int
	public var data: Any
}

public struct TFTPAckPacket {
	public var opcode: TFTPOperation
	public var blockNumber: Int
}

public struct TFTPErrorPacket {
	public var opcode: TFTPOperation
	public var errorCode: TFTPError
	public var errMsg: String
}
