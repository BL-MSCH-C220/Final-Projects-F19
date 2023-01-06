using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fireball : MonoBehaviour
{
    [Tooltip("Choose explosion effect.")]
    public GameObject explosionObject; // Choose explosion effect.
    [Tooltip("The flame object that spawns when the fireball hits the ground.")]
    public GameObject fireObject;
    [Tooltip("prefab of penguin on fire")]
    public GameObject penguinOnFireObject;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.y < 0)
        {
            Destroy(gameObject);
        }
        
    }

    private void OnCollisionEnter(Collision collision)
    {
        Destroy(gameObject);
        GameObject explosion = Instantiate(explosionObject, transform.position, Quaternion.identity, transform.parent) as GameObject;
        Destroy(explosion, 1.3f);
        if (collision.gameObject.tag.Equals("Ground"))
        {
            GameObject fire = Instantiate(fireObject, transform.position, Quaternion.identity, transform.parent) as GameObject;
        } else if (collision.gameObject.tag.Equals("Penguin"))
        {
            Transform origTransform = collision.gameObject.transform;
            GameObject firePenguin = Instantiate(penguinOnFireObject, origTransform.position, origTransform.rotation, origTransform.parent) as GameObject;
            Destroy(collision.gameObject);
        }
    }
}
