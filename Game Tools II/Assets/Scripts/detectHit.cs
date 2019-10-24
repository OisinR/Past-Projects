using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class detectHit : MonoBehaviour {

	public float healthbar;
	Animator anim;
	public string opponent;
	
	void OnTriggerEnter(Collider other)
	{
        Debug.Log("Hit");
		if(other.gameObject.tag != opponent) return;

		healthbar -= 30;

		if(healthbar <= 0)
			anim.SetBool("isDead",true);
	}



	// Use this for initialization
	void Start () {
	
		anim = GetComponentInChildren<Animator>();

	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
