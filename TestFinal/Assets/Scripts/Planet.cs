using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Planet : MonoBehaviour
{
    public Material planetMaterial;
    public Material cloudMaterial;

    public float rotateSpeed;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Quaternion rot = Quaternion.Euler(0, Time.time * rotateSpeed, 0);
        Matrix4x4 m = Matrix4x4.TRS(Vector3.zero, rot, Vector3.one);
        planetMaterial.SetMatrix("rotationMatrix", m);
        cloudMaterial.SetMatrix("rotationMatrix", m);
    }
}
