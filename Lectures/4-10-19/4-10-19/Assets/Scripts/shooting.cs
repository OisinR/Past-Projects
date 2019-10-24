using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shooting : MonoBehaviour
{
    public Transform bulletSpawn;
    public GameObject bulletPrefab;


    void Start()
    {
        
    }

    void Update()
    {
        if(Input.GetButtonDown("Fire1"))
        {
            GameObject bullet = Instantiate<GameObject>(bulletPrefab, bulletSpawn.position, bulletSpawn.rotation);
            Debug.Log("Fire");
        }
    }
}
