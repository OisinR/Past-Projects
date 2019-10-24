using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserControl : MonoBehaviour {


    private float pturn, pforward;
    private Character pcharacter;
    private bool pjump,ppick;

    void Start()
    {
        pcharacter = GetComponent<Character>();
    }

    void FixedUpdate()
    {
        pturn = Input.GetAxis("Horizontal");
        pforward = Input.GetAxis("Vertical");
        pjump = Input.GetButtonDown("Jump");
        ppick = Input.GetKeyDown(KeyCode.E);
        pcharacter.Move(pturn,pforward,pjump,ppick);
    }

}
