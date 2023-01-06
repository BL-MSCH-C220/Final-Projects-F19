using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnFireballs : MonoBehaviour
{
    [Tooltip("Drag the fireball object here.")]
    public GameObject fireballObject; // Drag the fireball object here.
    [Tooltip("The radius in which the spawner can spawn fireballs.")]
    public int range = 10; // The radius in which the spawner can spawn fireballs.
    [Tooltip("The frequency in which the fireballs should spawn in seconds.")]
    public float frequency = 1; // The frequency in which fireballs should spawn in seconds.
    private float timeSoFar = 0.0f;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        timeSoFar += Time.deltaTime;

        if (timeSoFar >= frequency)
        {
            spawnRandomFireball();
            timeSoFar = 0;
        }
    }

    void spawnRandomFireball()
    {
        int randomX = Random.Range(-range, range);
        int randomZ = Random.Range(-range, range);
        GameObject fireball = Instantiate(fireballObject, transform.position + new Vector3(randomX, 0, randomZ), Quaternion.identity, transform);
    }
}
