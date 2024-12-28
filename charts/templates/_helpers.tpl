
{{- define "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.labels" -}}
helm.sh/chart: {{ include "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.chart" . }}
{{ include "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaefc5606-9e1d-4694-93a8-d21cbc61a161.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}