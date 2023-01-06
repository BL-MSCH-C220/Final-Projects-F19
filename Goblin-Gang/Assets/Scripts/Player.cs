using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Player : MonoBehaviour
{
    public int SavedPenguins;
    public int KilledPenguins;
    public int Money;
    public GameObject MoneyObject;
    public GameObject KarmaObject;
    public GameObject Water;
    public int Karma;
    private int Health;
    private bool Invul = true;
    public GameObject HealthObject;
    // Start is called before the first frame update
    void Start()
    {
        SavedPenguins = 0;
        KilledPenguins = 0;
        Money = 0;

        Health = 100;
        HealthObject.GetComponent<Text>().text = "Health: " + Health;
    }

    public void KilledPenguin(){
        KilledPenguins += 1;
        Money += 200;
        Karma -= 100;
        KarmaObject.GetComponent<Text>().text = "Karma: " + Karma;
        MoneyObject.GetComponent<Text>().text = "$" + Money;
    }

    public void SavedPenguin(){
        SavedPenguins += 1;
        Karma += 50;
        KarmaObject.GetComponent<Text>().text = "Karma: " + Karma;
    }

    public void Damage(){
        Health -= 10;
        HealthObject.GetComponent<Text>().text = "Health: " + Health;
    }

    void Update(){
        if(gameObject.transform.position.y < Water.transform.position.y){
            SceneManager.LoadScene("Lose");
        }

        if(Invul){
            foreach (GameObject i in GameObject.FindGameObjectsWithTag("Fire")){
                float Distance = 0;
                var xDiff = i.transform.position.x - gameObject.transform.position.x;
                var zDiff = i.transform.position.z - gameObject.transform.position.z;
                Distance = Mathf.Pow(Mathf.Pow(xDiff, 2) + Mathf.Pow(zDiff, 2), (float) 0.5);

                if(Distance < 3){
                    Invul = false;
                    Damage();
                    StartCoroutine("TakeDamage");
                }
            }
        }
        
    }

    IEnumerator TakeDamage(){
        yield return new WaitForSeconds(2.0f);
        Invul = true;
    }
}
