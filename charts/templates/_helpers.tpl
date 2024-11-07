
{{- define "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.fullname" -}}
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


{{- define "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.labels" -}}
helm.sh/chart: {{ include "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.chart" . }}
{{ include "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc33b99d-0498-4dae-8b28-f2efe815de40.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}