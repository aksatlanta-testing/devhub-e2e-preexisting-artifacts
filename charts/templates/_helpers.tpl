
{{- define "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.fullname" -}}
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


{{- define "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.labels" -}}
helm.sh/chart: {{ include "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.chart" . }}
{{ include "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5e230a95-ef27-489f-9a4d-73c3329114aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}