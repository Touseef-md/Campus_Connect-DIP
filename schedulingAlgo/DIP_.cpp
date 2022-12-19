#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/wait.h>
#include <pthread.h>
#include <bits/stdc++.h>
#include <unistd.h>
#include <semaphore.h>
#include <ctime>
using namespace std;

time_t initial_time = time(NULL);
enum items
{
    pizza,
    burger,
    AlooParatha,
    Dosa,
    FriedMomos,
};
vector<int> AvgTime = {30, 5, 25, 30, 20};

priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;

vector<vector<int>> OngoingOrders((int(items::FriedMomos) + 1), vector<int>(2, initial_time));

class order
{
public:
    int id;
    int time;
    int completionTime;
    vector<pair<int, int>> orderItems;
};
void deleteOrder(vector<order> &orders)
{
    time_t globalTime;
    while (true)
    {
        time(&globalTime);
        cout << "Global time" << globalTime << endl;
        cout << pq.size() << endl;
        usleep(3000);
        if (!pq.empty())
        {
            cout << pq.top().first << endl;
            if (globalTime - pq.top().first >= 0)
            {
                cout << "Order Completed with order ID: " << pq.top().second << endl;
                int size = orders[pq.top().second].orderItems.size();
                for (int i = 0; i < size; i++)
                {
                    OngoingOrders[orders[pq.top().second].orderItems[i].first][0] -= orders[pq.top().second].orderItems[i].second;
                }
                pq.pop();
            }
        }
        else
        {
            cout << "FInishhed all orders" << endl;
            break;
        }
    }
}
vector<int> apnasort(vector<order> &orders)
{
    // cout << "sort fumction" << endl;
    vector<int> orderResponseTime;
    int flag = 0;
    for (int i = 0; i < orders.size(); i++)
    {
        int size = orders[i].orderItems.size();
        time_t maxi = -1;
        int id;
        for (int j = 0; j < size; j++)
        {
            id = orders[i].orderItems[j].first;            // Order ID
            int quantity = orders[i].orderItems[j].second; // ORder quantity
            int avgtime = AvgTime[id] * ceil(sqrtl(double(quantity)));
            int ongoingTime = OngoingOrders[id][1];
            time_t currTime;
            time(&currTime);
            if (currTime + (OngoingOrders[id][0] + quantity) * avgtime < ongoingTime)
            {
                maxi = max(maxi, currTime + avgtime);
            }
            else
            {
                if (OngoingOrders[id][0] == 0)
                {
                    maxi = max(maxi, currTime + avgtime);
                    OngoingOrders[id][1] = currTime + avgtime;
                }
                else
                {
                    maxi = max(maxi, currTime - ongoingTime + avgtime);
                    OngoingOrders[id][1] += avgtime;
                }
            }
            // }
            OngoingOrders[id][0] += quantity;
            // maxi=max(maxi,avgtime);
            // maxi=max(maxi,ongoingTime);
        }
        pq.push({maxi, i});
        orders[i].completionTime = maxi;
        // orderResponseTime.push_back(maxi);
    }
    // cout << "finished" << endl;
    return orderResponseTime;
}
int main()
{
    int n, size, temp1, temp2;
    cin >> n;
    vector<order> orders(n);
    for (int i = 0; i < OngoingOrders.size(); i++)
    {
        OngoingOrders[i][0] = 0;
    }
    for (int i = 0; i < n; i++)
    {
        cin >> temp1 >> size;
        orders[i].time = initial_time + temp1;
        for (int j = 0; j < size; j++)
        {
            cin >> temp1 >> temp2;
            orders[i].orderItems.push_back({temp1, temp2});
        }
    }
    apnasort(orders);
    for (int i = 0; i < OngoingOrders.size(); i++)
    {
        cout <<"Ongoing order's Table "<< i  << OngoingOrders[i][0] << "  " << OngoingOrders[i][1] - initial_time << endl;
    }
    for (int i = 0; i < n; i++)
    {
        cout << "Completion Time of order "<<i<<" "<< "is "<<orders[i].completionTime - initial_time  << endl;
    }
    deleteOrder(orders);
    return 0;
}