Shader "Unlit/003"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_Color("Color",Color)=(1,1,1,1)
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			//#include "UnityCG.cginc"

			fixed3 _Color;

			struct a2v
			{
				float4 vertex:POSITION;
				float3 normal:NORMAL;
				float4 texcoord:TEXCOORD0;
			};
			
			struct v2f
			{
				float4 pos:SV_POSITION;
				fixed3 color : COLOR0;
			};

			v2f vert(a2v a) 
			{
				v2f o;
				o.pos= UnityObjectToClipPos(a.vertex);
				o.color = a.normal*0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}

			fixed4 frag(v2f o):SV_TARGET
			{
				fixed3 c=o.color;
				c*=_Color.rgb;
				return fixed4(c,1);
			}
			ENDCG
		}
	}
}
