
Shader "L3/PlanetShd"
{
    Properties
    {
        _Diffuse( "Diffuse", 2D ) = "white" {}
        _NormalMap( "NormalMap", 2D ) = "white" {}
        _OceanMask( "Mask", 2D ) = "white" {}
        _OceanColor( "Ocean Color", Color ) = (1,0,0,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque"}
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag


            #include "UnityCG.cginc"
            #include "UnityStandardUtils.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                // ??? -> Ajouter de la tangente pour appliquer la normale map
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                // ??? -> Sortie de la normale en coordonnées Monde
                // ??? -> Sortie de la direction de l'oeil ou view dir
                // ??? -> Sortie de la tangente en coordonnées Monde
                // ??? -> Sortie de la binormale en coordonnées Monde
            };

            // Texture de couleur de la terre
            sampler2D _Diffuse;

            // Texture de normal map
            sampler2D _NormalMap;
            float4    _NormalMap_ST;

            // Masque de l'océan
            sampler2D _OceanMask;

            // Couleur de l'océan
            // ??? -> ajouter une couleur customisable
            
            // Matrice de rotation de la planète
            // ??? -> ajouter une matrice de rotation

           
            v2f vert (appdata v)
            {
                v2f o;

                // ??? -> Rotation de la matrice Object to World
               

                // Projection du vertex dans l'espace de clipping
                o.vertex = UnityObjectToClipPos( v.vertex );

                // ??? ->  Calcul de la normale dans l'espace Monde par vertex
               
                
                // ??? -> Calcul de la direction de l'oeil (view dir) dans l'espace Monde
                

                // ??? -> Calcul de la tangente et la binormal dans l'espace Monde
                

                // Export de l'UV
                o.uv = v.uv;
                return o;
            }


            fixed4 frag( v2f i ) : SV_Target
            {
                // UVs pour la sphère
                float2 planetUV = i.uv;

                // ??? -> Calcul de la normal en coordonnées monde par pixel à partir de la normal map
               

                // ??? -> Calculer la lumière directionnelle avec la formule de Half Lambert diffuse
                

                // Lecture de la texture de couleur (diffuse)
                fixed4 diffuse = tex2D( _Diffuse, planetUV );
                 
                // ??? -> Lecture de la texture masque de l'océan
                

                // ??? -> Remplacer la couleur de l'océan dans la diffuse par la couleur customisable à l'aide du masque


                // ??? -> Calcul de la lumière spéculaire due à la lumière directionnelle avec la fonction reflect

                // ??? -> Combinaise de la diffuse et du spéculaire (l'océan seul doit refléter) et application de l'éclairage
                fixed4 outputColor = diffuse;

                return outputColor;
            }
            ENDCG
        }
    }
}
