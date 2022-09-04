import NIOCore

public final class TFTPRequestPacketEncoder: ChannelOutboundHandler {
	public typealias OutboundIn = TFTPRequestPacket
	public typealias OutboundOut = IOData

	public init() {}

	public func write(context: ChannelHandlerContext, data: NIOAny, promise: EventLoopPromise<Void>?) {
		let requestPacket = unwrapOutboundIn(data)
		var buffer = context.channel.allocator.buffer(capacity: 256)
		buffer.writeInteger(requestPacket.opcode.rawValue)
		buffer.writeString(requestPacket.fileName)
		buffer.writeInteger(0)
		buffer.writeString(requestPacket.mode.rawValue)
		buffer.writeInteger(0)
		context.write(wrapOutboundOut(.byteBuffer(buffer)), promise: promise)
	}
}
