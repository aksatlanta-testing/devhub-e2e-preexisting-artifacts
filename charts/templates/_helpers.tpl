
{{- define "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.fullname" -}}
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


{{- define "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.labels" -}}
helm.sh/chart: {{ include "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.chart" . }}
{{ include "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e997392-764c-40dd-a9f3-a9d0104bffce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}