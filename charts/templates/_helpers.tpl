
{{- define "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.fullname" -}}
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


{{- define "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.labels" -}}
helm.sh/chart: {{ include "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.chart" . }}
{{ include "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2829e961-46be-4c49-b6f4-699b6d21d42b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}