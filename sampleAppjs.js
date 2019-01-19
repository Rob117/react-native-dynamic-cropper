/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View } from 'react-native';
import { Button } from 'react-native';
import DynamicCropper from 'react-native-dynamic-cropper';

export default class App extends Component {
    constructor(props) {
        super(props)
        this.state = {
            // To get img path
            // xcrun simctl list | egrep '(Booted)' for your simulator ID, and sub below
            imagePath: "/Users/<USERNAME>/Library/Developer/CoreSimulator/Devices/<SIM UDID FROM ABOVE>/data/Media/DCIM/100APPLE/<IMG that you want>"
        }
    }

    cropImage = () => {
        DynamicCropper.cropImage(this.state.imagePath, {/*options here, or an empty hash if you need no options*/}).then(newlyCroppedImagePath =>
            console.log(newlyCroppedImagePath)
        );
    }
    render() {
        return (
            <View style={styles.container}>
                <Button
                    title="Delicious"
                    color="#841584"
                    onPress={this.cropImage}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});
