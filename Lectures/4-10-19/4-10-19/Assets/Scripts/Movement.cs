using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{
    float speed = 10;

    void Start()
    {
        
    }

    void Update()
    {
        
        transform.Translate(0, 0, Input.GetAxis("Vertical") * speed * Time.deltaTime);

        transform.Rotate(0, Input.GetAxis("Horizontal") * 2 * speed * Time.deltaTime,0);
    }
}
