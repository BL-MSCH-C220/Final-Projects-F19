using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterRise : MonoBehaviour
{
    public GameObject Water;
    // public GameObject Ice;
    private Animator animator;
    // Start is called before the first frame update
    void Start()
    {
        animator = Water.GetComponent<Animator>();
        animator.Play("WaterRise");
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
