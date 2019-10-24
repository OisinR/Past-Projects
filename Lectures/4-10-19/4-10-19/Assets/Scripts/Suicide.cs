using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Suicide : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Invoke("KillMe", 5);
    }

    // Update is called once per frame
    void KillMe()
    {
        Destroy(gameObject);
    }
}
