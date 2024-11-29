
{{- define "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.fullname" -}}
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


{{- define "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.labels" -}}
helm.sh/chart: {{ include "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.chart" . }}
{{ include "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b019af4-d035-43e1-a348-f1efa1c599cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}