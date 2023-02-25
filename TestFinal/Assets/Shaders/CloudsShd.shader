Shader "L3/CloudShd"
{
    Properties
    {
        _Clouds( "Clouds", 2D ) = "white" {}
        _FresnelColor ( "Fresnel Color", Color ) = (0,0,1,1)
        [PowerSlider( 4 )] _FresnelExponent( "Fresnel Exponent", Range( 0.25, 8 ) ) = 1
    }
    SubShader
    {
        // R�glage du shader pour la transparence
        Tags { "RenderType"="Transparent" "Queue"="Transparent"}
        LOD 100

        // ??? -> Changer le mode de blending pour : "premultiplied" (Src * Alpha + Dst)
        Blend Zero One

        // ??? -> Rendu double face : changer le mode de culling pour que les deux faces de la sph�re soient rendues
        // Cull ???

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                // ??? -> Sortie de la normale en coordonn�es Monde
                // ??? -> Sortie de la direction de l'oeil ou view dir
            };

            // Texture de la couche de nuages
            sampler2D _Clouds;

            // Matrice de rotation de la couche de nuages et atmosph�re
            // ??? -> Ajouter une matrice de rotation

            // Couleur du fresnel (atmosph�re simul�e)
            float4 _FresnelColor;

            // Puissance du fresnel
            float _FresnelExponent;

            v2f vert (appdata v)
            {
                v2f o;
                // ??? -> application de la matrice de rotation � la matrice object to world

                // calcul du vertex dans l'espace de clipping
                o.vertex = UnityObjectToClipPos( v.vertex );

                // ??? -> Sortie de la normale dans l'espace Monde

                // ??? -> Calcul et sortie de la view direction dans l'espace Monde
                
                o.uv = v.uv;
                return o;
            }

            fixed4 frag( v2f i ) : SV_Target
            {
                // UVs pour la sph�re
                float2 planetUV = i.uv;

                // ??? -> Calculer la lumi�re directionnelle avec la formule de Half Lambert Diffuse, m�me chose que dans le shader "planetShd"
                
                // ??? -> Calculer du fresnel pour l'atmosph�re
                
                // ??? -> Combiner la couche de nuages et le fresnel de l'atmosph�re
                float4 clouds = tex2D( _Clouds, planetUV );
                
                // ??? -> Appliquer l'�clairage � la couche de nuages + fresnel
                fixed4 outputColor = clouds;

                return outputColor;
            }
            ENDCG
        }
    }
}
