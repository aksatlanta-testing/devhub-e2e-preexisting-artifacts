
{{- define "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.fullname" -}}
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


{{- define "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.labels" -}}
helm.sh/chart: {{ include "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.chart" . }}
{{ include "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e0c8790-8b2b-4fb9-9e36-65d9ce10de8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}