
{{- define "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.fullname" -}}
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


{{- define "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.labels" -}}
helm.sh/chart: {{ include "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.chart" . }}
{{ include "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6794d54a-6433-44b8-b4a3-b699061244fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}