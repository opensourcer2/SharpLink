using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProtoBuf;

namespace Skynet.Models
{
    [ProtoContract]
    public class ToxRequest
    {
        [ProtoMember(1)]
        public string url { get; set; }
        [ProtoMember(2)]
        public string method { get; set; }
        [ProtoMember(3)]
        public string uuid { get; set; }
        [ProtoMember(4)]
        public byte[] content { get; set; }
        [ProtoMember(5)]
        public string fromNodeId { get; set; }
        [ProtoMember(6)]
        public string fromToxId { get; set; }
        [ProtoMember(7)]
        public string toNodeId { get; set; }
        [ProtoMember(8)]
        public string toToxId { get; set; }
        [ProtoMember(9)]
        public long time { get; set; }

        public ToxRequest()
        {
            time = 0;
        }

        public ToxResponse createResponse(byte[] content = null)
        {
            return new ToxResponse
            {
                url = this.url,
                uuid = this.uuid,
                fromNodeId = this.toNodeId,
                fromToxId = this.toToxId,
                toToxId = this.fromToxId,
                toNodeId = this.fromNodeId,
                content = content,
            };
        }

        public byte[] getBytes()
        {
            Console.WriteLine("ToxRequest getBytes");
            using (MemoryStream ms = new MemoryStream())
            {
                Console.WriteLine("ToxRequest getBytes0.1");
                Serializer.Serialize(ms, this);
                Console.WriteLine("ToxRequest getBytes0.2");

                var res = ms.ToArray();
                Console.WriteLine("ToxRequest getBytes 1");
                return res;
            }
        }

        public static ToxRequest fromBytes(byte[] data)
        {
            using (MemoryStream ms = new MemoryStream(data))
            {
                return Serializer.Deserialize<ToxRequest>(ms);
            }
        }


    }
}
