using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Colours : MonoBehaviour
{
    public Material[] colours;
    Material mycolour;

    void Start()
    {
        mycolour = colours[Random.Range(0, 3)];
        GetComponent<Renderer>().material = mycolour;
    }

    void Update()
    {
        
    }
}
