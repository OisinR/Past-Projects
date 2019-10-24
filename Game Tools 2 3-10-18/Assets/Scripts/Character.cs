using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character : MonoBehaviour {


    private Animator panim;

	void Start ()
    {
        panim = GetComponent<Animator>();
	}


    public void Move(float turn, float forward, bool jump, bool pick)
    {
        panim.SetFloat("Turn", turn);
        panim.SetFloat("Forward", forward);
        if (jump)
        {
            panim.SetBool("Jump", jump);            
        }
        if (pick)
        {
            panim.SetBool("Pick", pick);
        }
    }
}
