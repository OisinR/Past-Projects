using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    float speed = 10;

    void Start()
    {
        
    }

    void Update()
    {
        transform.Translate(0, 0, speed * Time.deltaTime);
    }
}
