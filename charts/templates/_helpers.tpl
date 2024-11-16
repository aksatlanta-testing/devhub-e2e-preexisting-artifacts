
{{- define "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.fullname" -}}
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


{{- define "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.labels" -}}
helm.sh/chart: {{ include "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.chart" . }}
{{ include "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc708c86-0743-403d-8a5d-15e40aa7f154.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}