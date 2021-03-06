﻿using System;
using System.Collections.Generic;
using System.Reactive;
using System.Threading.Tasks;

namespace IMQTTClientRx.Model
{
    public interface IMQTTClient : IDisposable
    {
        bool IsConnected { get; }

        IObservable<Unit> ObservableConnect { get; }
        IObservable<bool> ObservableDisconnect { get; }
        IObservable<IMQTTMessage> ObservableMessage { get; }

        Task ConnectAsync();
        Task DisconnectAsync();
        Task SubscribeAsync(params ITopicFilter [] topicFilters);
        Task UnsubscribeAsync(params ITopicFilter [] topicFilters);
        Task UnsubscribeAsync(params string[] topics);
        Task PublishAsync(IMQTTMessage message);
        
    }
}
