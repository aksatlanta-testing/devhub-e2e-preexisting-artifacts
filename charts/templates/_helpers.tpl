
{{- define "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.fullname" -}}
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


{{- define "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.labels" -}}
helm.sh/chart: {{ include "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.chart" . }}
{{ include "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2a9f262e-a7e3-4660-a65b-5a5b2296e7ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}