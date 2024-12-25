
{{- define "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.fullname" -}}
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


{{- define "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.labels" -}}
helm.sh/chart: {{ include "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.chart" . }}
{{ include "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo918eda68-c7dd-4a0a-b2d1-e5991841a0cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}