using SharpTox.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using ProtoBuf;

namespace Skynet.Models
{
	[ProtoContract]
    class Package
    {
		[ProtoMember(1)]
        public string uuid { get; set; } // 36 bytes string 
		[ProtoMember(2)]
        public byte[] content { get; set; }
		[ProtoMember(3)]
        public int totalCount { get; set; }
		[ProtoMember(4)]
        public int currentCount { get; set; }
		[ProtoMember(5)]
        public uint totalSize { get; set; }
		[ProtoMember(6)]
        public uint startIndex { get; set; }


        public byte[] toBytes()
        {
			using (MemoryStream ms = new MemoryStream())
			{
				Serializer.Serialize(ms, this);
				return ms.ToArray();
			}
        }

        public static Package fromBytes(byte[] data)
        {
			using (MemoryStream ms = new MemoryStream(data))
			{
				return Serializer.Deserialize<Package>(ms);
			}
        }
    }


}
