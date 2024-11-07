
{{- define "go-echo767070c1-2db8-4512-b229-9c287787a1d7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo767070c1-2db8-4512-b229-9c287787a1d7.fullname" -}}
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


{{- define "go-echo767070c1-2db8-4512-b229-9c287787a1d7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo767070c1-2db8-4512-b229-9c287787a1d7.labels" -}}
helm.sh/chart: {{ include "go-echo767070c1-2db8-4512-b229-9c287787a1d7.chart" . }}
{{ include "go-echo767070c1-2db8-4512-b229-9c287787a1d7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo767070c1-2db8-4512-b229-9c287787a1d7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo767070c1-2db8-4512-b229-9c287787a1d7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}