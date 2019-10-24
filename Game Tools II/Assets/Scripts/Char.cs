using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Char : MonoBehaviour
{
    private Rigidbody pRb;
    private Animator panim;
    public float moveSpeed;
    private float pForward, pStrafe;

	void Start ()
    {
        panim = GetComponentInChildren<Animator>();
        pRb = GetComponent<Rigidbody>();
	}

    private void Update()
    {
        pForward = Input.GetAxis("Vertical") * moveSpeed;
        pStrafe = Input.GetAxis("Horizontal") * moveSpeed;
        Vector3 velocity = pRb.velocity;
        if (pForward <0.1f & pForward >-0.1f)
        {
            velocity.x = pStrafe;
        }
        velocity.z = pForward;
        pRb.velocity = velocity;
    }

    public void Move(float forward, float strafe, bool jump, bool attack)
    {
        panim.SetFloat("Forward", forward);

        panim.SetFloat("Strafe", strafe);
        if (jump)
        {
            panim.SetTrigger("Jump");
        }
        if (attack)
        {
            panim.SetTrigger("Attack");
        }
    }
}
