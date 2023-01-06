using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WinText : MonoBehaviour
{

    public GameObject Message;
    // Start is called before the first frame update
    void Start()
    {
        GameObject Player = GameObject.FindGameObjectWithTag("Player");
        int Karma = Player.GetComponent<Player>().Karma;
        Message.GetComponent<Text>().text = "Congratulations! You finsihed with " + Karma + " karma. Thank you for saving the penguins. [Press Escape to Exit]";
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
