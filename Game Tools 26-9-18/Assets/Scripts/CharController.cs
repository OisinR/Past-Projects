using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharController : MonoBehaviour {

    public bool idle = true;
    public bool walking = false;
    public bool aiming = false;

    public Animator Anim;


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            Anim.SetBool("Walk", true);
            Anim.SetBool("Aim", false);
            Anim.SetBool("Idle", false);

        }
        if (Input.GetButtonDown("Fire2"))
        {
            Anim.SetBool("Walk", false);
            Anim.SetBool("Aim", false);
            Anim.SetBool("Idle", true);
        }
        if (Input.GetButtonDown("Jump"))
        {
            Anim.SetBool("Walk", false);
            Anim.SetBool("Aim", true);
            Anim.SetBool("Idle", false);
        }
    }
}
