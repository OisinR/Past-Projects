using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Footprint : MonoBehaviour {

    
    private AudioSource pAudioSource;
    private Animator anim;
    private Transform pRightFootTransform;
    private Transform pLeftFootTransform;

    [SerializeField] GameObject pFootprint;
    [SerializeField] AudioClip paudioClip;

    private enum Direction { right, left};

    public void Start()
    {
        pAudioSource = GetComponent<AudioSource>();
        anim = GetComponent<Animator>();

        pRightFootTransform = anim.GetBoneTransform(HumanBodyBones.RightFoot);
        pLeftFootTransform = anim.GetBoneTransform(HumanBodyBones.LeftFoot);
    }

    public void footprint(int scale)
    {

        Direction footDirection;
        if (scale > 0)
        {
            footDirection = Direction.left;
            Instantiate(pFootprint, pLeftFootTransform.position, pLeftFootTransform.rotation);

        }
        else
        {
            footDirection = Direction.right;
            Instantiate(pFootprint, pRightFootTransform.position, pRightFootTransform.rotation);
        }
        playSound(footDirection);
    }

    private void playSound(Direction footDirection)
    {
        if (pAudioSource != null)
        {
            if(footDirection == Direction.left)
            {
                pAudioSource.panStereo = -0.5f;
                pAudioSource.pitch = Random.Range(1.0f,2.0f);
            }
            if(footDirection == Direction.right)
            {
                pAudioSource.panStereo = +0.5f;
                pAudioSource.pitch = Random.Range(2.0f, 3.0f);

            }
            pAudioSource.PlayOneShot(paudioClip);
        }
    }
}
