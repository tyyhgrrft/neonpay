import 'react-native-gesture-handler';
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Text, View, StyleSheet, TouchableOpacity, Alert } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const Tab = createBottomTabNavigator();

function LoginScreen({ navigation }) {
  return (
    <View style={s.c}>
      <Text style={s.t}>NeonPay</Text>
      <TouchableOpacity style={s.g} onPress={() => navigation.replace('Home')}>
        <Text style={s.gt}>One-Tap Guest Mode</Text>
      </TouchableOpacity>
    </View>
  );
}

function HomeScreen() {
  return (
    <View style={s.c}>
      <Text style={s.b}>$12,484.92</Text>
      <Text style={s.u}>Last updated: Now</Text>
      <View style={s.r}>
        <TouchableOpacity style={s.snd}><Text style={s.st}>SEND</Text></TouchableOpacity>
        <TouchableOpacity style={s.rcv}><Text style={s.rt}>RECEIVE</Text></TouchableOpacity>
      </View>
    </View>
  );
}

function TradeScreen() {
  const bet = (dir) => Alert.alert('Trade!', `You predicted ${dir}`, [{text:'OK'}]);
  return (
    <View style={s.c}>
      <Text style={s.p}>SOL/USDT • $178.42</Text>
      <View style={s.r}>
        <TouchableOpacity style={s.up} onPress={() => bet('UP')}><Text style={s.ut}>UP</Text></TouchableOpacity>
        <TouchableOpacity style={s.down} onPress={() => bet('DOWN')}><Text style={s.dt}>DOWN</Text></TouchableOpacity>
      </View>
    </View>
  );
}

function WalletScreen() { return <View style={s.c}><Text style={s.t}>Wallet • BUY / SELL</Text></View>; }
function LearnScreen() { return <View style={s.c}><Text style={s.t}>Learn • 12% APY</Text></View>; }

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator screenOptions={{headerShown:false, tabBarStyle:{backgroundColor:'#000',height:70}}}>
        <Tab.Screen name="Login" component={LoginScreen} options={{tabBarStyle:{display:'none'}}} />
        <Tab.Screen name="Home" component={HomeScreen} options={{tabBarIcon:()=><Ionicons name="home" size={30} color="#00ff9d"/>}} />
        <Tab.Screen name="Trade" component={TradeScreen} options={{tabBarIcon:()=><Ionicons name="trending-up" size={36} color="#00ff9d"/>}} />
        <Tab.Screen name="Wallet" component={WalletScreen} options={{tabBarIcon:()=><Ionicons name="wallet" size={30} color="#00ff9d"/>}} />
        <Tab.Screen name="Learn" component={LearnScreen} options={{tabBarIcon:()=><Ionicons name="school" size={30} color="#00ff9d"/>}} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}

const s = StyleSheet.create({
  c:{flex:1,backgroundColor:'#000',justifyContent:'center',alignItems:'center'},
  r:{flexDirection:'row',gap:30,marginTop:50},
  t:{fontSize:52,fontWeight:'900',color:'#00ff9d',marginBottom:80},
  g:{backgroundColor:'#00ff9d',paddingHorizontal:60,paddingVertical:26,borderRadius:20,marginBottom:20},
  gt:{color:'#000',fontSize:26,fontWeight:'bold'},
  b:{fontSize:48,color:'#00ff9d',fontWeight:'bold'},
  u:{color:'#666',marginTop:10},
  snd:{backgroundColor:'#00ff9d',paddingHorizontal:50,paddingVertical:30,borderRadius:20},
  st:{color:'#000',fontSize:28,fontWeight:'bold'},
  rcv:{backgroundColor:'#007aff',paddingHorizontal:45,paddingVertical:30,borderRadius:20},
  rt:{color:'#fff',fontSize:28,fontWeight:'bold'},
  p:{fontSize:36,color:'#00ff9d',fontWeight:'bold'},
  up:{backgroundColor:'#00ff9d',padding:50,borderRadius:30},
  ut:{fontSize:36,color:'#000',fontWeight:'bold'},
  down:{backgroundColor:'#ff3366',padding:50,borderRadius:30},
  dt:{fontSize:36,color:'#fff',fontWeight:'bold'},
});