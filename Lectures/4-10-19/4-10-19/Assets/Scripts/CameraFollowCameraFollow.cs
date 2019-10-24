using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollowCameraFollow : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    public Transform cameratarget;
    void Update()
    {
        transform.position = Vector3.Lerp(transform.position, cameratarget.position, Time.deltaTime);
        transform.LookAt(cameratarget.parent);
    }
}
